RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  factory :user do
    name   "Ralph"
    email  "ralph@example.com"
end 

FactoryGirl.define do
  factory :user do
    name   "Megan"
    email  "megan@example.com"
end 