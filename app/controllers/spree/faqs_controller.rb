module Spree
  class FaqsController < StoreController
    helper 'spree/products'

    def index
      @categories = Spree::QuestionCategory.includes(:questions).load
    end

    def default_title
      Spree.t(:frequently_asked_questions, scope: :spree_faq)
    end
  end
end
