# require 'rails_helper'

# RSpec.describe 'developer features' do
#   before(:all) do
#     @account = Account.create(email: 'test@gmail.com', password: 'testtest', password_confirmation: 'testtest')
#     # @account = build(:account)
#     login_as(@account)
    
#   end

  # it 'redirects to show page if current account already has a developer profile' do
    
  #   @developer = Developer.create(
  #     first_name: 'Test',
  #     last_name: 'Developer',
  #     title: 'Boss dev',
  #     about: 'Lorem ipsum',
  #     profile_picture: "#{Rails.root}/public/images/avatar.png",
  #     role_types: ['fulltime'],
  #     search_status: 'is_active',
  #     city: '3650 Egedal',
  #     account_id: @account.id
  #   )

  #   visit '/udviklere/ny'
    
  #   expect(current_path).to eql('/udviklere/test-developer')
    
  #   # response.should redirect_to '/udviklere/test-developer'
  
  # end

  # it 'creates a developer and displays the name and image on the developer page' do
  #   visit('udviklere/ny')
    
  #   fill_in 'developer_first_name',          with: 'Test'
  #   fill_in 'developer_last_name',           with: 'Developer'
  #   fill_in 'developer_title',               with: 'Super boss'
  #   fill_in 'developer_about',               with: 'Lorem ipsum'
    # select '3650 Egedal',                    from: 'developer[city]'
    # select 'Ruby',                           from: 'developer[programming_languages][]'

    # attach_file 'developer_profile_picture', "#{Rails.root}/public/images/avatar.png"
    # check 'developer_role_types_fulltime'
    # check 'developer_role_types_parttime'
    # check 'developer_role_types_remote'
    # fill_in 'developer_website',             with: 'https://preisler.io'
    # fill_in 'developer_github',              with: 'https://github.com/jonaspreisler/'
    
    # click_button('Opret profil')
    # expect{ click_button 'Opret profil' }.to change(Developer, :count).by(1)

    # expect(current_path).to eql('/udviklere/ny')

    # # visit('/udviklere/test-developer')
    # # get developer_path(Developer.friendly.find('test-developer'))
    # expect(current_path).to eql('/udviklere/test-developer')
    # expect(page).to have_content('Test Developer')
    # expect(page).to have_content('preisler.io')
    # expect(page.find('.profile-picture')['src']).to have_content('avatar.png')
#   end

# end

