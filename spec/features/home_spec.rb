require 'rails_helper'

RSpec.describe 'home features' do
  it 'displays the name of the app and links to the developers index page' do
    visit '/'
    expect(page).to have_content('Danske Udviklere')
    click_link('Søg i listen')
    expect(current_path).to eql('/udviklere')
    expect(page).to have_content('Danske udviklere')
  end
end

