require 'rails_helper'

describe User do 

  before do 
    @user = User.new(name: 'kyle', email: 'kylekozma@gmail.com',
                     password: "foobar", password_confirmation: "foobar")
  end 

  it "should have a valid name and email" do 
    expect(@user.valid?).to eq(true) 
  end 

  it "name should be present" do 
    @user.name = ('   ')
    expect(@user.valid?).to eq(false)
  end 

  it "email should be present" do 
    @user.email = ('   ')
    expect(@user.valid?).to eq(false)
  end 

  it "name should not be too long" do 
    @user.name = "a" * 51
    expect(@user.valid?).to eq(false)
  end  

  it "email should not be too long" do 
    @user.email = "a" * 250 + "@gmail.com"
    expect(@user.valid?).to eq(false)
  end 

  it "email validation should accept valid addresses" do 
    valid_addresses = %w[user@example.com USER@test.org user-foo@user.com 
                        user+foo@example.cn user.foo@example.jp]
    valid_addresses.each do |valid_address| 
      @user.email = valid_address
       puts "#{valid_address.inspect} should be valid"
      expect(@user.valid?).to eq(true) 
    end
  end 

  it "email validation should reject invalid email addresses" do 
    invalid_addresses = %w[user/me@example.com user.foo.com 
                          user@email. user@email+example.com]
    invalid_addresses.each do |invalid_address| 
      @user.email = invalid_address
      puts "#{invalid_addresses.inspect} should be invalid"
      expect(@user.valid?).to eq(false)
    end 
  end 

  it 'email address should be unique' do 
    duplicate_user = @user.dup 
    duplicate_user.email = @user.email.upcase 
    @user.save 
    expect(duplicate_user.valid?).to eq(false)
  end 

  it "password should have a minimum length" do 
    @user.password = @user.password_confirmation = "a" * 5
    expect(@user.valid?).to eq(false)
  end 
end 

