module Spree
  class Question < ActiveRecord::Base
    acts_as_list

    belongs_to :question_category, touch: true, inverse_of: :questions
    validates :question_category_id, :question, :answer, presence: true
    delegate :name, to: :question_category, prefix: true, allow_nil: true
    default_scope -> { order(position: :asc) }
  end
end
