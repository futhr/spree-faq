RSpec.describe Spree::QuestionCategory, type: :model do

  context 'instance attributes' do
    it 'create a new instance given valid attributes' do
      described_class.create!(name: 'Question 1')
    end
  end

  it 'factory is valid' do
    expect(build(:question_category)).to be_valid
  end

  context 'relation' do
    it { is_expected.to have_many(:questions) }

    it 'have questions' do
      expect(subject.questions).not_to be_nil
    end
  end

  context 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  context 'acts as list' do

    subject { create(:question_category) }

    before do
      2.times { create(:question_category) }
    end

    it 'can have its position changed' do
      subject.move_to_bottom
      expect(subject.position).to be(3)
    end
  end
end
