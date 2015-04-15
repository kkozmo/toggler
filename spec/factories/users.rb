RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  factory :user do
    name   "Ralph"
    sequence(:email) {|n| "test#{n}@example.com"}
    password 'testtest'
    password_confirmation 'testtest'
  end 

  # factory :brokenuser, parent: :user do
  #   name ""
  #   email "asserttest@invalid"
  #   password "foo"
  #   password_confirmation "bar"
  # end
end 