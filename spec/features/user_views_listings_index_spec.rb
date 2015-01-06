require "rails_helper"

feature "User views all the listings", %{
  As a user,
  I want to view all of the available listings,
  So I can choose a desk to rent.

  Acceptance Criteria:
  [ ] I must see a list of all available listings
  [ ] If there are no available listings, I see a link to add a listing
  [ ] Each item should show the address, title and a picture if available
} do

  before :each do
    @listing = FactoryGirl.create(:listing)
  end

  scenario "user views the index of listings" do
    visit listings_path

    expect(page).to have_content "All Available Listings"
    expect(page).to have_content @listing.title
    expect(page).to have_content @listing.address
    expect(page).to have_content @listing.city

  end
end
