RSpec.feature 'Admin Questions', :js do
  stub_authorization!

  given!(:question_category) { create(:question_category, name: 'Shopping') }

  background do
    visit spree.admin_questions_path
  end

  context 'create new category' do
    background do
      click_link 'New Question'
    end

    scenario 'can save with valid name' do
      select2 'Shopping', from: 'Question Category'
      fill_in 'Question', with: 'You sell stuff?'
      fill_in 'Answer', with: 'Yupp..'
      click_button 'Create'
      within_table('listing_questions') do
        expect(page).to have_text 'You sell stuff?'
      end
    end

    scenario 'raises error when empty name' do
      click_button 'Create'
      expect(page).to have_text 'Question can\'t be blank'
    end
  end

  context 'modify' do
    background do
      create(
        :question,
        question_category: question_category,
        question: 'You buy stuff?',
        answer: 'Yupp..'
      )
      visit spree.admin_questions_path
    end

    scenario 'can update category' do
      within_table('listing_questions') do
        expect(page).to have_text 'You buy stuff?'
        click_icon :edit
      end
      expect(page).to have_text 'Editing Question'

      fill_in 'Question', with: 'You sell stuff?'
      click_button 'Update'

      within_table 'listing_questions' do
        expect(page).to have_text 'You sell stuff?'
      end
    end
  end
end
