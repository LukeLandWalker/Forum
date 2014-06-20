require 'spec_helper'

describe Post do
  
  let(:user) { FactoryGirl.create(:user) }
  before do
  
    @post = user.posts.build(name: "Example post", content: "This is an example post", types: "topic", user_id: user.id)
  end
  subject { @post }
    
  it { should respond_to(:name) }
  it { should respond_to(:content) }
  it { should respond_to(:types) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) {  should eq user }
  
  it { should be_valid }

  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end 
  
  describe "with name is too short" do
    before { @post.name = "a" * 9 }
    it { should_not be_valid }
  end

  describe "with name is too long" do
    before { @post.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "with content is too short" do
    before { @post.content = "a" * 14 }
    it { should_not be_valid }
  end  
end
