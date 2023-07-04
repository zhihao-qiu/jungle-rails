require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    let(:firstname) { Faker::Name.first_name }
    let(:lastname) { Faker::Name.last_name }
    let(:email) { Faker::Internet.email }
    let(:password_length) { 8 }

    it 'is valid with valid fields set' do
      user = User.new(
        firstname: firstname,
        lastname: lastname,
        email: email,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it 'is invalid if password and password_confirmation are not the same' do
      user = User.new(
        firstname: firstname,
        lastname: lastname,
        email: email,
        password: 'password',
        password_confirmation: 'password123'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is invalid if password is empty' do
      user = User.new(
        firstname: firstname,
        lastname: lastname,
        email: email,
        password: '',
        password_confirmation: 'password'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is invalid if email exists' do
      existing_user = User.create(
        firstname: firstname,
        lastname: lastname,
        email: email,
        password: 'password',
        password_confirmation: 'password'
      )
      user = User.new(
        firstname: firstname,
        lastname: lastname,
        email: email,
        password: 'password',
        password_confirmation: 'password'
      )

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Email has already been taken")
    end

    it 'is invalid if email is empty' do
      user = User.new(
        firstname: firstname,
        lastname: lastname,
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is invalid if first name is empty' do
      user = User.new(
        firstname: nil,
        lastname: lastname,
        email: email,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Firstname can't be blank")
    end

    it 'is invalid if last name is empty' do
      user = User.new(
        firstname: firstname,
        lastname: nil,
        email: email,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Lastname can't be blank")
    end
  end

  describe 'Length of Password' do
    let(:firstname) { Faker::Name.first_name }
    let(:lastname) { Faker::Name.last_name }
    let(:email) { Faker::Internet.email }
    let(:password_length) { 8 }
    it 'is invalid if password does not exceed the minimum length(8)' do
      user = User.new(
        firstname: firstname,
        lastname: lastname,
        email: email,
        password: 'pass',
        password_confirmation: 'pass'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is "+password_length.to_s+" characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    let(:firstname) { Faker::Name.first_name }
    let(:lastname) { Faker::Name.last_name }
    let(:email) { 'eXample@domain.COM'  }
    let(:password) { 'password' }
    let(:password_confirmation) { 'password' }
    before do
      User.create(
        firstname: firstname,
        lastname: lastname,
        email: email,
        password: password,
        password_confirmation: password_confirmation
      )
    end

    it 'should returns the user instance if authenticated' do
      user = User.find_by_email(email)
      authenticated_user = User.authenticate_with_credentials(email, password)
      expect(authenticated_user).to eq(user)
    end

    it 'should returns nil if not authenticated' do
      authenticated_user = User.authenticate_with_credentials(email, 'wrong_password')
      expect(authenticated_user).to be_nil
    end

    it 'should ignores case sensitivity in email' do
      user = User.find_by_email(email)
      authenticated_user = User.authenticate_with_credentials(email.upcase, password)
      expect(authenticated_user).to eq(user)
    end

    it 'should ignores leading/trailing white spaces in email' do
      user = User.find_by_email(email)
      authenticated_user = User.authenticate_with_credentials('  ' + email.to_s + '  ', password)
      expect(authenticated_user).to eq(user)
    end

  end
end