FactoryGirl.define do
  factory :user do
    name  "wangyifu"
    email "wangyifu@nibirutech.com"
    password "foobar"
    password_confirmation "foobar"
  end
  
  factory :post do
    name "Example post"
    content "This is an example post"
    types "topic"
    user
  end
end
