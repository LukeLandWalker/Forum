require 'spec_helper'

describe "User pages" do
 
 describe "GET /users_pages" do
    it "should have the content 'Sample Forum'" do
      visit '/users'
      expect(page).to have_content('Sample Forum')
    end
  end

  subject { page }
  
  describe "signup page" do
    before { visit signup_path}
    
    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end
end
