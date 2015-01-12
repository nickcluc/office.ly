require "rails_helper"

feature "user signs out", %{
  As an authenticated user
  I want to sign out
  So that my identity is forgotten about on the machine I'm using
} do

  let (:test_user) do
    FactoryGirl.create(:user)
  end

  scenario "authenticated user signs out" do
    sign_in_as(test_user)

    click_link "Sign Out"
    expect(page).to have_content("Signed out successfully")
  end

  scenario "unauthenticated user attempts to sign out" do
    visit "/"
    expect(page).to_not have_content("Sign Out")
  end
end
