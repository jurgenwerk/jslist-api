module Api
  module V1
    class FrameworksController < ApplicationController

      def index
        render json: { frameworks: Framework.all }
      end

      def show
        render json: { framework: Framework.find(params[:id]) }
      end
    end
  end
end
