require 'rails_helper'

feature 'User creates a listing', %Q{
  As a user
  I want to Log In and create a Listing
  So I can rent out my desk when I am on vacation

  Acceptance Criteria:

  [ ] A user must enter a title, address, city, state, and weekly rate
  [ ] A user can optionally add a description
  [ ] When successfully listed, I should see a success message & my listing
  [ ] When listing is unsuccessful, I should see an error message
  [ ] A user must be logged in to list a desk, if not logged in, should see an error
} do

  before :each do
    user = FactoryGirl.create(:user)

    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password

    click_button 'Sign up'

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

  end


  scenario 'User Logs In & Creates A Valid Listing' do

    listing = FactoryGirl.build(:listing)

    visit new_listing_path

    expect(page).to have_content "Create New Listing"

    fill_in 'Title', with: listing.title
    fill_in 'Address', with: listing.address
    fill_in 'City', with: listing.city
    fill_in 'State', with: listing.state
    fill_in 'Zip Code', with: listing.zip_code
    fill_in 'Description', with: listing.description
    fill_in 'Weekly Rate - USD', with: listing.rate_cents

    click_button "Create Listing"

    expect(page).to have_content "Listing Created Successfully!"
  end

  scenario 'User Logs In & Creates an Invalid Listing' do

    visit new_listing_path

    click_button "Create Listing"

    expect(page).to have_content("can't be blank")
  end

end
