require 'rails_helper'
require_relative '../support/devise'

RSpec.describe 'business features', type: :feature do

  login_developer_account

  it 'can create a business' do
    visit root_path
    expect(page).to have_content('Min virksomheds profil')
    click_link 'Min virksomheds profil'
    expect(page).to have_content('OPRET VIRKSOMHEDS PROFIL')
    click_link 'Ok, kom i gang!'
    expect(page).to have_css('#business_name')
    fill_in 'business_name', with: 'Test2 business'
    expect{ click_button 'Opret profil' }.to change(Business, :count).by(1)

    expect(current_path).to eql('/virksomhed/test2-business')
    expect(page).to have_content('Test2 business')
    expect(page).to have_content('Rediger')

  end

end

