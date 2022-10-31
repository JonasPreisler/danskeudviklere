require 'rails_helper'

RSpec.describe 'home features' do
  before do
    visit '/'
  end

  it 'displays the name of the app and links to the developers index page' do
    expect(page).to have_content('Danske Udviklere')
    click_link('Søg i listen')
    expect(current_path).to eql('/udviklere')
    expect(page).to have_content('Danske udviklere')
  end

  context "account is signed in" do
    before do
      @account = build(:account)
      login_as(@account)
      visit root_path
    end

  end

end

