module Spree
  class QuestionCategory < ActiveRecord::Base
    acts_as_list

    has_many :questions, class_name: 'Spree::Question'
    validates :name, presence: true
    validates :name, uniqueness: { case_sensitive: false }
    accepts_nested_attributes_for :questions, allow_destroy: true
    attr_accessible :name, :questions_attributes, :question, :answer
  end
end
