require 'spec_helper'

describe "UsersPages" do
  describe "GET /users_pages" do
    it "should have the content 'New User'" do
      visit '/users'
      expect(page).to have_content('New User')
    end
  end
end
