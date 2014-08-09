RSpec.describe Spree::Question, type: :model do

  let!(:question_category) { create(:question_category) }
  let(:question) { create(:question, question_category_id: question_category.id) }

  subject { question }

  it 'factory is valid' do
    expect(build(:question)).to be_valid
  end

  context 'instance attributes' do
    it 'creates a new instance given valid attributes' do
      described_class.create!(question: 'Question 1',
                              answer: 'Answer 1',
                              question_category: create(:question_category))
    end
  end

  context 'relation' do
    it { is_expected.to belong_to(:question_category) }

    it 'belongs to a category' do
      expect(subject.question_category).not_to be_nil
    end
  end

  context 'validation' do
    it { is_expected.to validate_presence_of(:question_category_id) }
    it { is_expected.to validate_presence_of(:question) }
    it { is_expected.to validate_presence_of(:answer) }

    it 'requires a category' do
      invalid_question = build(:question, question_category: nil)
      expect(invalid_question.valid?).to be_falsey
      expect(invalid_question.errors[:question_category_id].size).to be(1)
    end

    it 'requires a question' do
      invalid_question = build(:question, question: nil)
      expect(invalid_question.valid?).to be_falsey
      expect(invalid_question.errors[:question].size).to be(1)
    end

    it 'requires a answer' do
      invalid_question = build(:question, answer: nil)
      expect(invalid_question.valid?).to be_falsey
      expect(invalid_question.errors[:answer].size).to be(1)
    end
  end

  context 'acts as list' do

    before do
      2.times { create(:question) }
    end

    it 'can have its position changed' do
      subject.move_to_bottom
      expect(subject.position).to eq(3)
    end
  end
end
