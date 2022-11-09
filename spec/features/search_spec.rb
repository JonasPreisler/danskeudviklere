require 'rails_helper'
require_relative '../support/devise'

RSpec.describe 'search feature', type: :feature, js: true do

  create_developer

  before(:each) do
    visit developers_path
  end

  it 'can search stack 0 results' do
    expect(page).to have_content("#{I18n.t 'developers.index.search.results'}")
    expect(page).to have_css('#search_lang_Vue', visible: :all)
    find('.languages label[for="search_lang_Vue"').click
    # choose 'search_lang_Vue', visible: :all
    expect(page).to have_content("Vue")
    expect(page).to_not have_css('.card-body .tag', text: 'Vue')
    expect(page).to have_content("#{I18n.t 'developers.index.search.no_results'}")
  end

  it 'can search stack' do
    expect(page).to have_css('#search_lang_Ruby', visible: :all)
    find('.languages label[for="search_lang_Ruby"').click
    expect(page).to have_css('.card-body .tag', text: 'Ruby on Rails')
    expect(page).to have_content('Test Developer')
  end


  it 'can search role_level 0 results' do
    expect(page).to have_css('#search_role_level_senior', visible: :all)
    find('.role_levels label[for="search_role_level_senior"').click
    expect(page).not_to have_css('.card-body', text: 'Midlevel')
    expect(page).to have_content("#{I18n.t 'developers.index.search.no_results'}")
  end

  it 'can search role_level' do
    expect(page).to have_css('#search_role_level_midlevel', visible: :all)
    find('.role_levels label[for="search_role_level_midlevel"').click
    expect(page).to have_css('.card-body', text: 'Midlevel')
  end

  it 'can search city 0 results' do
    find('.cities label[for="search_city_Århus"').click
    expect(page).not_to have_css('.card-body', text: 'København')
    expect(page).not_to have_css('.card-body', text: 'Århus')
    expect(page).to have_content("#{I18n.t 'developers.index.search.no_results'}")
  end

  it 'can search city' do
    expect(page).to have_css('#search_city_København', visible: :all)
    find('.cities label[for="search_city_København"').click
    expect(page).to have_css('.card-body', text: 'København')
  end

  it 'can search stack + city' do
    find('.cities label[for="search_city_København"').click
    find('.languages label[for="search_lang_Ruby"').click
    expect(page).to have_css('.card-body .tag', text: 'Ruby on Rails')
    expect(page).to have_css('.card-body', text: 'København')
    expect(page).to have_content('Test Developer')
  end
  
  it 'can search stack + city 0 results' do
    find('.cities label[for="search_city_Århus"').click
    find('.languages label[for="search_lang_Ruby"').click
    expect(page).to_not have_css('.card-body .tag', text: 'Ruby on Rails')
    expect(page).to_not have_css('.card-body', text: 'København')
    expect(page).to_not have_content('Test Developer')
    expect(page).to have_content("#{I18n.t 'developers.index.search.no_results'}")
  end
end

