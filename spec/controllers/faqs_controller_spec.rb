RSpec.describe Spree::FaqsController, type: :controller do

  let!(:question_category) { create(:question_category) }
  let!(:question) { create(:question, question_category: question_category) }

  before { allow(controller).to receive(:try_spree_current_user) }

  context '#index' do
    specify do
      categories = [
        question_category,
        create(:question_category),
        create(:question_category)
      ]

      spree_get :index
      expect(assigns(:categories)).to eq categories
      expect(response).to be_success
    end
  end

  context '#default_title' do
    it 'returns default title' do
      expect(subject.default_title).to eq Spree.t(:frequently_asked_questions, scope: :spree_faq)
    end
  end
end
