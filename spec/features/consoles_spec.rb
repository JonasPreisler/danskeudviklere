# require 'rails_helper'

# RSpec.describe 'Consoles features' do
#   describe 'viewing the index' do
#     it 'lists all the consoles' do
#       Console.create(name: 'Switch', manufacturer: 'Nintendo')
#       Console.create(name: 'Wii', manufacturer: 'Nintendo')

#       visit '/'
#       click_link 'Consoles'
#       expect(page).to have_content('Nintendo Switch')
#       expect(page).to have_content('Nintendo Wii')
#     end
#   end

#   describe 'adding a new console' do
#     it 'adds the console to the list of consoles' do
#       visit '/'
#       click_link 'Consoles'
#       click_link 'Add new console'

#       expect(current_path).to have_content('consoles/new')

#       fill_in('Name', with: 'Playstation Vita')
#       fill_in('Manufacturer', with: 'Sony')
#       click_button 'Create console'

#       expect(page).to have_content('Sony Playstation Vita')
#       expect(current_path).to have_content('/consoles')
#     end
#   end
# end