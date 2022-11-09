# require 'rails_helper'
# require_relative '../support/devise'

# RSpec.describe 'message features', type: :view do

#   login_business_account

#   it 'can create a business' do

#     FactoryBot.create(:account, :developer)

#     visit '/udviklere/test-developer'
#     expect(page).to have_content('Send besked')
#     click_link('Send besked')
#     visit '/chat/ny?developer=test-developer'
#     expect(page).to have_css('#new_conversation')
#     expect(page).to have_css('#conversation_messages_attributes_0_content')
#     fill_in 'conversation_messages_attributes_0_content', with: 'blablabla'
#     expect{ click_button 'Send' }.to change(Conversation, :count).by(1)
#     expect(page).to have_content('Super boss')
#     fill_in 'message_content', with: 'first message'
#     expect{ click_button 'Send' }.to change(Message, :count).by(1)
#     expect(page).to have_content('first message')
#   end

# end

require 'rails_helper'
require_relative '../support/devise'

RSpec.describe 'message features', type: :view do


  feature 'as business' do
    create_developer
    login_business_account

    scenario 'business sends a new message to developer' do
      visit '/udviklere/test-developer'
      expect(page).to have_content('Send besked')
      click_link('Send besked')
      visit '/chat/ny?developer=test-developer'
      expect(page).to have_css('#new_conversation')
      expect(page).to have_css('#conversation_messages_attributes_0_content')
      fill_in 'conversation_messages_attributes_0_content', with: 'blablabla'
      expect{ click_button 'Send' }.to change(Conversation, :count).by(1)
      expect(page).to have_css('#chat')
      expect(page).to have_content('blablabla')
      expect(page).to have_content('Super boss')
      fill_in 'message_content', with: 'first message'
      # expect{ click_button 'Send' }.to change(Message, :count).by(1)
      find('#submit_message').click
      sleep 4
      expect(page).to have_content('first message')

      Capybara.using_session :developer do
        @request.env['devise.mapping'] = Devise.mappings[:account]
        @developer_account = FactoryBot.create(:account)
        login_as @developer_account
        visit root_path
        find('i.la-comment').click
        expect(page).to have_content('first message')
        fill_in 'message_content', with: 'second message'
        expect{ click_button 'Send' }.to change(Message, :count).by(1)
        expect(page).to have_content('second message')
      end
    end
  end

end

