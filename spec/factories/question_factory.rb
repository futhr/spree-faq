FactoryGirl.define do
  factory :question, class: Spree::Question do
    association :question_category, factory: :question_category

    sequence(:question) { |n| "question#{n}" }
    answer { generate(:random_description) }
  end
end
