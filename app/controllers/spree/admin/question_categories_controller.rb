module Spree
  module Admin
    class QuestionCategoriesController < ResourceController
      before_filter :question_category, only: [:new, :edit]

      private

      def question_category
        @question_category ||= @object
      end

      def safe_params
        [
          :questions_attributes,
          :question,
          :answer,
          question: [:question_category_id, :question, :answer]
        ]
      end

      def question_category_params
        params.require(:question_category).permit(*safe_params)
      end
    end
  end
end
