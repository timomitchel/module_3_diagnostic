require "rails_helper"

# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

describe 'as a user' do 
  it "can search by zip" do 
    visit root_path
    save_and_open_page
    fill_in "q", with: "80203"
    click_on "Locate"
    expect(current_path).to eq "/search"
    expect(page).to have_content "10 results"
    expect(page).to have_css(".station", count: 10)
    expect(page).to have_css(".name", count: 10)
    expect(page).to have_css(".address", count: 10)
    expect(page).to have_css(".fuel_type", count: 10)
    expect(page).to have_css(".distance", count: 10)
    expect(page).to have_css(".access_times", count: 10)
  end
end