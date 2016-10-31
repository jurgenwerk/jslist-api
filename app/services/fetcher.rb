class Fetcher
  class << self
    def update_github_stars_all
      Framework.all.each do |framework|
        update_github_stars(framework)
      end
    end

    def update_github_stars(framework)
      client = Octokit::Client.new(client_id: ENV.fetch("GITHUB_CLIENT_ID"),
        client_secret: ENV.fetch("GITHUB_CLIENT_SECRET"))
      repo_path = framework.properties["repoUrl"].split("/").last(2).join("/")
      stars_count = client.repo(repo_path)["stargazers_count"]
      framework.update(properties: framework.properties.merge("githubStars" => stars_count))
    rescue Octokit::NotFound, Octokit::InvalidRepository => ex
      Rails.logger.error "Github Star updating failure: #{ex.message}"
    end
  end
end
