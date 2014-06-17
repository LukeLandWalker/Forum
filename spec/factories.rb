FactoryGirl.define do
  factory :user do
    name      "wangyifu"
    email     "wangyifu@nibirutech.com"
    password  "foobar"
    password_confirmation "foobar"
    remember_token "123"
  end
end
