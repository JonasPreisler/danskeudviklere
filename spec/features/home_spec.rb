require 'rails_helper'

RSpec.describe 'home features' do
  before do
    @account = Account.create(email: 'test@gmail.com', password: 'testtest')
    login_as(@account)
    visit '/'
  end

  it 'displays the name of the app and links to the developers index page' do
    expect(page).to have_content('Danske Udviklere')
    click_link('Søg i listen')
    expect(current_path).to eql('/udviklere')
    expect(page).to have_content('Udviklere')
  end

  it 'can create a business' do
    click_link 'Min virksomheds profil'
    expect(page).to have_content('OPRET VIRKSOMHEDS PROFIL')
    click_link 'Ok, kom i gang!'
    expect(page).to have_css('#business_name')
    fill_in 'business_name', with: 'Test business'
    expect{ click_button 'Opret profil' }.to change(Business, :count).by(1)

    expect(current_path).to eql('/virksomhed/test-business')
    expect(page).to have_content('Test business')
    expect(page).to have_content('Rediger')

  end

end

