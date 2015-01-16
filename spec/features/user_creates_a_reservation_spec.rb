feature "User Creates a Reservation", %{
  As a user,
  I want to make a reservation for a listing,
  So I can work there.

  Acceptance Criteria:
  [ ] I must be able to create a reservation from the show page.
  [ ] The reservation must have total cost, start date, end date, user, and listing
  [ ] Listing cannot be reserved at the same time.
  [ ] If a reservation is saved successfully, I receive a confirmation email and see a page with reservation details.
  [ ] If it is not saved successfully, I am presented with the errors.
  [ ] A listing owner cannot reserve their own space
} do

  let (:test_listing) do
    FactoryGirl.create(:listing)
  end

  let (:reserved_by) do
    FactoryGirl.create(:user)
  end

  let (:test_reservation) do
    FactoryGirl.build(:reservation)
  end

  scenario "User successfully creates a reservation" do
    sign_in_as(reserved_by)

    visit listing_path(test_listing)

    fill_in "Start Date", with: test_reservation.start_date
    fill_in "End Date", with: test_reservation.end_date


    click_button "Reserve #{test_listing.title}"

    expect(page).to have_content "Reservation for #{test_listing.title}"
    expect(page).to have_content "Reservation Start Date: Thursday March 5 2015"
    expect(page).to have_content "Reservation End Date: Thursday March 12 2015"

    expect(page).to have_content "Total Cost: $#{test_listing.weekly_rate * 1}"
  end

  scenario "User reverses start and end date" do
    sign_in_as(reserved_by)

    visit listing_path(test_listing)

    fill_in "Start Date", with: test_reservation.end_date
    fill_in "End Date", with: test_reservation.start_date
    click_button "Reserve #{test_listing.title}"

    expect(page).to have_content "Start date can't be after end date"
  end

  scenario "User tries to create a reservation in the past" do
    sign_in_as(reserved_by)

    visit listing_path(test_listing)

    fill_in "Start Date", with: "01/01/2015"
    fill_in "End Date", with: test_reservation.end_date
    click_button "Reserve #{test_listing.title}"

    expect(page).to have_content "Start date can't be in the past!"
  end

  scenario "Listing creator tries to reserve their own space" do
    sign_in_as(test_listing.user)

    visit listing_path(test_listing)
    expect(page).to_not have_button "Reserve #{test_listing.title}"
  end
end
