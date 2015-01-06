require "rails_helper"

feature "User views a listing's page", %{
  As a user,
  I want to view the details of a listing,
  So I can get  more information on the listing.

  Acceptance Criteria:
  [ ] I should see the title, address, city, state & weekly rate for the space.
} do
  let (:listing) do
    FactoryGirl.create(:listing)
  end

  scenario "User Views Details" do
    visit listing_path(listing)

    expect(page).to have_content listing.title
    expect(page).to have_content listing.address
    expect(page).to have_content listing.city
    expect(page).to have_content listing.state
    expect(page).to have_content listing.rate_cents
  end
end
