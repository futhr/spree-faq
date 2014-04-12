module Spree
  module Admin
    class QuestionCategoriesController < ResourceController
      before_filter :question_category, only: [:new, :edit]

      private

      def question_category
        @question_category ||= @object
      end
    end
  end
end
