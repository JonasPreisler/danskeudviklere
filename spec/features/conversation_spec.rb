require 'rails_helper'
require_relative '../support/devise'

RSpec.describe 'message features', type: :feature, js: true do


  feature 'as business' do
    create_developer
    login_business_account

    scenario 'business and developer can send and read a message from each other' do

      using_session("business") do
        visit '/udviklere/test-developer'
        expect(page).to have_content('Send besked')
        click_link('Send besked')
        visit '/chat/ny?developer=test-developer'
        expect(page).to have_css('#new_conversation')
        expect(page).to have_css('#conversation_messages_attributes_0_content')
        fill_in 'conversation_messages_attributes_0_content', with: 'blablabla'
        expect{ click_button 'Send' }.to change(Conversation, :count).by(1)
        expect(page).to have_css('#chat')
        expect(page).to have_css('.chatbox')
        expect(page).to have_content('blablabla')
        expect(page).to have_content('Super Boss')
        fill_in 'message_content', with: 'first message'
        expect{ click_button 'Send' }.to change(Message, :count).by(1)
        expect(page).to have_content('first message')
        find('nav img.rounded-circle').click
      end

      using_session("developer") do
        login_as @dev_account_1
        visit current_path
        expect(page).to have_css('i.la-comment')
        expect(page).to have_css(".las.la-comment .badge", text: "2")
        find('i.la-comment').click
        expect(page).to_not have_css(".las.la-comment .badge")
        expect(page).to have_content('first message')
        fill_in 'message_content', with: 'second message'
        expect{ click_button 'Send' }.to change(Message, :count).by(1)
        expect(page).to have_content('second message')
      end

      using_session("business") do
        expect(page).to have_content('second message')
      end


    end
  end

end

