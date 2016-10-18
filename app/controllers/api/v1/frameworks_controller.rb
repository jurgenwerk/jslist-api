module Api
  module V1
    class FrameworksController < ApplicationController

      def index
        render json: Framework.all
      end
    end
  end
end
