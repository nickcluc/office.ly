feature "User edits a listing they own", %{
  As a user,
  I want to be able to edit a listing I created,
  So I can update it with the most up to date information.

  Acceptance Criteria:
  [ ] I can edit a page I created
  [ ] If I did not create the listing, I can't update it.
  [ ] if listing is updated sccessfully, I see the updated details
        and a message that indicates it was successful.
  [ ] If it is not successful, the form is rerendered and I see an error msg.
} do

  let (:test_listing) do
    FactoryGirl.create(:listing)
  end

  let (:other_user) do
    FactoryGirl.create(:user)
  end

  scenario "User edits a page successfully" do
    sign_in_as(test_listing.user)

    visit listing_path(test_listing)

    expect(page).to have_content test_listing.title

    click_link "Edit Listing"

    fill_in "Title", with: "Edited Listing"

    click_on "Update Listing"

    expect(page).to have_content "Listing Updated Successfully"
    expect(page).to have_content "Edited Listing"
  end

  scenario "User edits a page unsuccessfully" do
    visit new_user_session_path

    fill_in "Email", with: test_listing.user.email
    fill_in "Password", with: test_listing.user.password

    click_on "Log in"

    visit listing_path(test_listing)

    expect(page).to have_content test_listing.title

    click_on "Edit Listing"

    fill_in "Title", with: ""

    click_on "Update Listing"

    expect(page).to have_content "can't be blank"
  end

  scenario "User who did not create listing tries to edit" do
    visit new_user_session_path

    fill_in "Email", with: other_user.email
    fill_in "Password", with: other_user.password

    click_button "Log in"

    visit listing_path(test_listing)
    expect(page).to_not have_content "Edit Listing"
  end
end
