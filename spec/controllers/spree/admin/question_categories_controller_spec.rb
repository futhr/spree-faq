RSpec.describe Spree::Admin::QuestionCategoriesController, type: :controller do
  stub_authorization!

  let!(:question_category) { create(:question_category) }

  context '#index' do
    before { spree_get :index }

    it 'renders the :index template' do
      expect(response).to render_template :index
    end
  end

  context '#new' do
    before { spree_get :new }

    it 'assigns a new Spree::QuestionCategory' do
      expect(assigns(:question_category)).to be_a_new Spree::QuestionCategory
    end

    it 'renders the :new template' do
      expect(response).to render_template :new
    end
  end

  context '#edit' do
    before { spree_get :edit, id: question_category }

    it 'assigns question_category to object' do
      expect(assigns(:question_category)).to eq question_category
    end

    it 'renders the :edit template' do
      expect(response).to render_template :edit
    end
  end

  describe '#create' do
    let(:attributes) { attributes_for(:question_category) }

    context 'with valid params' do
      it 'creates a new Spree::QuestionCategory' do
        expect {
          spree_post :create, question_category: attributes
        }.to change(Spree::QuestionCategory, :count).by(1)
      end

      it 'assigns a newly created question_category as @question_category' do
        spree_post :create, question_category: attributes
        expect(assigns(:question_category)).to be_a Spree::QuestionCategory
        expect(assigns(:question_category)).to be_persisted
      end
    end
  end

  context '#destroy' do
    it 'destroys the requested question_category' do
      expect {
        spree_delete :destroy, id: question_category
      }.to change(Spree::QuestionCategory, :count).by(-1)
    end

    it 'requires the :id parameter' do
      expect {
        spree_delete :destroy
      }.to raise_error(ActionController::UrlGenerationError)
    end
  end
end
