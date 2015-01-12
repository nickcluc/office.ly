feature "User posts a review", %{
  As a user,
  I want to post a review to a listing,
  So other can make a better decision on where they want to work.

  Acceptance Criteria:
  [ ] I must be signed in to post a review
  [ ] I cannot review the site if I own it
  [ ] I must rate and can optionally comment on it
  [ ] If it is successfully saved, I see a notification ont he listing page telling me so
  [ ] If it is not saved, I see a notification telling me so
} do

  let (:test_listing) do
    FactoryGirl.create(:listing)
  end

  let (:other_user) do
    FactoryGirl.create(:user)
  end

  scenario "User successfully posts a review" do
    test_review  = FactoryGirl.build(:review)
    sign_in_as(other_user)
    visit listing_path(test_listing)

    click_button "Leave a Review"

    select test_review.rating, from: "Overall Rating"
    fill_in "Review", with: test_review.comment

    click_button "Leave Review"

    expect(page).to have_content "Rating: #{test_review.rating}"
    expect(page).to have_content test_review.comment
  end

  scenario "User tries to review a site they created" do
    sign_in_as(test_listing.user)

    visit listing_path(test_listing)
    expect(page).to_not have_button "Leave a Review"
  end

  scenario "unauthenticated user tries to post a review" do
    visit listing_path(test_listing)
    click_button "Leave a Review"

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
