module Spree
  class QuestionCategory < ActiveRecord::Base
    acts_as_list

    has_many :questions, -> { order(:position) }, dependent: :destroy, inverse_of: :question_category

    validates :name, presence: true
    validates :name, uniqueness: { case_sensitive: false }

    default_scope -> { order(position: :asc) }
  end
end
