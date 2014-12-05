RSpec.feature 'Admin Question Categories', :js do
  stub_authorization!

  background do
    visit spree.admin_question_categories_path
  end

  context 'create new category' do
    background do
      click_link 'New Question Category'
    end

    scenario 'can save with valid name' do
      fill_in 'Name', with: 'Shopping'
      click_button 'Create'
      within_table('listing_question_categories') do
        expect(page).to have_text 'Shopping'
      end
    end

    scenario 'raises error when empty name' do
      click_button 'Create'
      expect(page).to have_text 'Name can\'t be blank'
    end
  end

  context 'modify' do
    background do
      create(:question_category, name: 'Shopping')
      visit spree.admin_question_categories_path
    end

    scenario 'can update category' do
      within_table('listing_question_categories') do
        expect(page).to have_text 'Shopping'
        click_icon :edit
      end
      expect(page).to have_text 'Editing Question Category'

      fill_in 'Name', with: 'Selling'
      click_button 'Update'

      within_table 'listing_question_categories' do
        expect(page).to have_text 'Selling'
      end
    end
  end
end
