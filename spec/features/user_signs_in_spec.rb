require "rails_helper"

feature "user signs in", %{
  As a signed up user
  I want to sign in
  So that I can regain access to my account
} do

  let (:test_user) do
    FactoryGirl.create(:user)
  end

  scenario "specify valid credentials" do
    sign_in_as(test_user)

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Sign Out")
  end

  scenario "specify invalid credentials" do
    visit new_user_session_path

    click_button "Log in"
    expect(page).to have_content("Invalid email or password")
    expect(page).to_not have_content("Sign Out")
  end
end
