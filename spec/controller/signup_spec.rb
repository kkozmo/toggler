require 'rails_helper'

describe UsersController, :type => :controller do

	let(:user_attributes) { FactoryGirl.attributes_for(:user, email: "invalid@email" ) }

  it 'invalid signup information' do 
     post :create, user: user_attributes
     expect(response).to render_template(:new)
  end 
end 



