module Spree
  module Admin
    class QuestionCategoriesController < ResourceController
      before_action :question_category, only: [:new, :edit]

      def index
        @question_categories = collection
      end

      private

      def collection
        params[:q] ||= {}
        @search = Spree::QuestionCategory.ransack(params[:q])
        @collection = @search.result.includes([:questions]).page(params[:page]).per(params[:per_page])
      end

      def question_category
        @question_category ||= @object
      end

      def safe_params
        [
          :name
        ]
      end

      def question_category_params
        params.require(:question_category).permit(*safe_params)
      end
    end
  end
end
