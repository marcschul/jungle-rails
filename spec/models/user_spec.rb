require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here
    it 'should create a new user' do
      @user = User.create(name: 'Flowers', email: 'flowers@email.com', password: nil)
      expect(@user).to_not be_valid
    end
  end
  
  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should validate user credentials with spaces' do
      @user = User.create(name: 'space_example', email: 'example@domain.com', password: '123')
      input_email = '  example@domain.com  '
      input_password = @user.password
      expect(User.authenticate_with_credentials(input_email, input_password)).to eq(@user)
    end
  
    it 'should create a new user, given input is upper and lower case' do
      @user = User.create(name: 'uppper_lower_example', email: 'exAmple@domain.Com', password: '123')
      input_email = 'eXample@domain.COM'
      input_password = @user.password
      expect(User.authenticate_with_credentials(input_email, input_password)).to eq(@user)
    end
  end
end
