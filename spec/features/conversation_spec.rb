require 'rails_helper'
require_relative '../support/devise'

RSpec.describe 'message features', type: :view do

  login_business_account

  it 'can create a business' do

    FactoryBot.create(:account, :developer)

    visit '/udviklere/test-developer'
    expect(page).to have_content('Send besked')
    click_link('Send besked')
    visit '/chat/ny?developer=test-developer'
    expect(page).to have_css('#new_conversation')
    expect(page).to have_css('#conversation_messages_attributes_0_content')
    fill_in 'conversation_messages_attributes_0_content', with: 'blablabla'
    expect{ click_button 'Send' }.to change(Conversation, :count).by(1)
    expect(page).to have_content('Super boss')
    fill_in 'message_content', with: 'first message.....'
    expect{ click_button 'Send' }.to change(Message, :count).by(1)
    expect(page).to have_content('first message.....')
  end

end

