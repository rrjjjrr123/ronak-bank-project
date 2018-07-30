require 'spec_helper'

feature 'Check-in working on "root path"', js: true do 
  scenario 'visit root path' do
    visit items_path 
    expect(page).to have_content 'Welcome to the online e-commerce website'
  end

  scenario 'goto purchase order'do
    click_on("purchase")
    expect(page).to eq("")
  end
end   