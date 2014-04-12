require 'spec_helper'

describe Spree::QuestionCategory do

  context 'instance attributes' do
    it 'create a new instance given valid attributes' do
      described_class.create!(name: 'Question 1')
    end
  end

  context 'factory' do
    it 'is valid' do
      expect(build(:question_category)).to be_valid
    end
  end

  context 'relation' do
    it { should have_many(:questions) }

    it 'have questions' do
      expect(subject.questions).not_to be_nil
    end
  end

  context 'validation' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should accept_nested_attributes_for(:questions) }
  end

  context 'acts as list' do

    subject { create(:question_category) }

    before do
      2.times { create(:question_category) }
    end

    it 'can have its position changed' do
      subject.move_to_bottom
      expect(subject.position).to eq(3)
    end
  end
end
