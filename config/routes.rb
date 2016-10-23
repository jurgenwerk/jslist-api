Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :frameworks, only: [:index, :show]
    end
  end
end
