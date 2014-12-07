RSpec.feature 'FAQ', :js do

  given!(:user) { create(:user) }
  given!(:question_category) { create(:question_category, name: 'Shopping') }
  given!(:question) do
    create(
      :question,
      question_category: question_category,
      question: 'You sell stuff?',
      answer: 'Yupp..'
    )
  end

  background do
    visit spree.faq_path
  end

  scenario 'have all elements' do
    expect(page).to have_text 'Frequently Asked Questions'
    expect(page).to have_text question_category.name
    expect(page).to have_text question.question
    expect(page).to have_text question.answer
  end

  context 'when click on question' do
    scenario 'show answer' do
      click_link question.question
      expect(page).to have_text question.answer
    end
  end
end
