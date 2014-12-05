RSpec.feature 'Admin FAQ', :js do
  stub_authorization!

  given!(:admin_user) { create(:admin_user) }

  background do
    visit spree.admin_path
  end

  scenario 'have faq tab in menu sidebar' do
    expect(page).to have_text 'FAQ'
  end
end
