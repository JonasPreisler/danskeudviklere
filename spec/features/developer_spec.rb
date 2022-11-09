require 'rails_helper'

RSpec.describe 'developer features', type: :feature do
  before(:each) do
    @account = FactoryBot.create(:account)
    login_as(@account)
  end

  it 'redirects to show page if current account already has a developer profile' do
    
    @developer = Developer.new(
      first_name: 'Test',
      last_name: 'Developer',
      slug: 'test-developer',
      title: 'Boss dev',
      about: 'Lorem ipsum',
      role_types: ['fulltime'],
      search_status: 0,
      city: 'København',
      account_id: @account.id
    )
    expect{ @developer.save }.to change(Developer, :count).by(1)

    visit '/udviklere/ny'
    
    expect(current_path).to eql('/udviklere/test-developer')
  end

  it 'can create a developer', js: true do
    visit('udviklere/ny')
    
    fill_in 'developer_first_name',          with: 'Test'
    fill_in 'developer_last_name',           with: 'Developer'
    fill_in 'developer_title',               with: 'Super boss'
    fill_in 'developer_about',               with: 'Lorem ipsum'
    page.all('.select2-container')[0].click
    find('li.select2-results__option', text: 'København').click
    page.all('.select2-container')[1].click
    find('li.select2-results__option', text: 'Ruby on Rails').click
    check 'developer_role_types_fulltime'
    check 'developer_role_types_parttime'
    check 'developer_role_types_remote'
    fill_in 'developer_website',             with: 'https://preisler.io'
    fill_in 'developer_github',              with: 'https://github.com/jonaspreisler/'
    
    expect{ click_button 'Opret profil' }.to change(Developer, :count).by(1)
    expect(current_path).to eql('/udviklere/test-developer')
    expect(page).to have_content('Test Developer')
    expect(page).to have_content('preisler.io')
    expect(page.find('.profile-picture')['src']).to have_content('avatar.png')
  end

end

