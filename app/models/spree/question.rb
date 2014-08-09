module Spree
  class Question < ActiveRecord::Base
    acts_as_list

    belongs_to :question_category, class_name: 'Spree::QuestionCategory'
    validates  :question_category_id, :question, :answer, presence: true
    attr_accessible :question, :answer, :question_category_id, :question_category
  end
end
