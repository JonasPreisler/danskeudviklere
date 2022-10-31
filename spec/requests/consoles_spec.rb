# require 'rails_helper'

# RSpec.describe 'Consoles requests' do

#   before do
#     consoles = [
#       {name: 'NES', manufacturer: 'Nintendo'},
#       {name: 'SNES', manufacturer: 'Nintendo'},
#       {name: 'WII', manufacturer: 'Nintendo'},
#       {name: 'Genesis', manufacturer: 'Sega'},
#       {name: 'Xbox', manufacturer: 'Microsoft'},
#       {name: 'Switch', manufacturer: 'Nintendo'},
#       {name: 'PS1', manufacturer: 'Sony'},
#       {name: 'PS2', manufacturer: 'Sony'}
#     ]
#     consoles.each do |console|
#       Console.create(console)
#     end
#   end

#   describe 'GET /consoles' do
#     it 'returns an array of video games consoles' do
#       get '/consoles'
#       expect(response_json['consoles']).to include(
#         'Nintendo NES',
#         'Nintendo SNES',
#         'Nintendo WII',
#         'Microsoft Xbox',
#         'Nintendo Switch',
#         'Sony PS1',
#         'Sony PS2'
#       )
#     end

#     it 'supports specifying consoles for a specific manufacturer' do
#       get '/consoles', params: { manufacturer: 'Nintendo' }
#       expect(response_json['consoles']).to contain_exactly(
#         'Nintendo NES',
#         'Nintendo SNES',
#         'Nintendo WII',
#         'Nintendo Switch'
#       )

#     end
#   end
# end