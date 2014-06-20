require 'spec_helper'

describe "Post_pages" do
  
  subject { page }  

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:post)   { FactoryGirl.create(:post, user: user) }

    before { visit post_path(post) }
    
    it { should have_title(full_title(post.name))  }

  end

  describe "post creation" do
    let(:user) { FactoryGirl.create(:user) }
    
    describe "for non-signed-in users" do
      before { visit new_post_path }
      
      it { should have_title('Sign in') }
    
    end

    describe "after signing in" do
      before do
        visit new_post_path
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button  "Sign in"
      end
      
      it { should have_title(full_title("New post")) }   
  
      describe "with invalid information" do
    
        it "should not create a post" do
          expect { click_button "Post" }.not_to change(Post, :count)
        end

        describe "error messages" do
          before { click_button "Post" }
          it { should have_content('error') }
        end
      end
  
      describe "with valid information" do
    
        before do
          visit new_post_path
          fill_in "Content", with: "This is a example post" 
          fill_in "Name",    with: "Example post"
        end
        it "should create a post" do
          expect { click_button "Post" }.to change(Post, :count).by(1)
        end
      end
    end
  end
end

