module Api
  module V1
    class FrameworksController < ApplicationController

      def index
        render json: { frameworks: Framework.order("cast(properties->>'jsIndex' as integer) desc").to_a }
      end

      def show
        render json: { framework: Framework.find(params[:id]) }
      end
    end
  end
end
