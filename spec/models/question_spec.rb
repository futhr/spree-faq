describe Spree::Question do

  let!(:question_category) { create(:question_category) }
  let(:question) { create(:question, question_category_id: question_category.id) }

  subject { question }

  context 'factory' do
    it 'is valid' do
      expect(build(:question)).to be_valid
    end
  end

  context 'instance attributes' do
    it 'create a new instance given valid attributes' do
      described_class.create!(question: 'Question 1',
                              answer: 'Answer 1',
                              question_category: create(:question_category))
    end
  end

  context 'relation' do
    it { should belong_to(:question_category) }

    it 'belong to a category' do
      expect(subject.question_category).not_to be_nil
    end
  end

  context 'validation' do
    it { should validate_presence_of(:question_category_id) }
    it { should validate_presence_of(:question) }
    it { should validate_presence_of(:answer) }

    it 'require a category' do
      invalid_question = build(:question, question_category: nil)
      expect(invalid_question).to have(1).error_on(:question_category_id)
    end

    it 'require a question' do
      invalid_question = build(:question, question: nil)
      expect(invalid_question).to have(1).error_on(:question)
    end

    it 'require a answer' do
      invalid_question = build(:question, answer: nil)
      expect(invalid_question).to have(1).error_on(:answer)
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
