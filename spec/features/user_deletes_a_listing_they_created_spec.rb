feature "User deletes a listing they create", %{
  As a listing creator
  I want to delete a listing
  So I can remove out of date listings.

  Acceptance Criteria:
  [ ] If I created the listing, I can delete the listing
  [ ] If the listing is successfully deleted, I see a notice it was successful
  [ ] i should not be able to delete the listing if I did not create it.
} do

  let (:test_listing) do
    FactoryGirl.create(:listing)
  end

  scenario "User successfully deletes a listing" do
    sign_in_as(test_listing.user)

    visit listing_path(test_listing)

    click_link "Delete Listing"

    expect(page).to have_content "Listing Deleted Successfully"
  end

end
