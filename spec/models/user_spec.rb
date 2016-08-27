require 'rails_helper'

describe User do
  it 'email is saved as lowercased' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    user = create :user, email: mixed_case_email
    expect(user.email).to eq(mixed_case_email.downcase)
  end

  describe 'validations' do
    it 'is valid' do
      user = build :user
      expect(user).to be_valid
    end

    describe 'name' do
      it 'is present' do
        user = build :user, name: ''
        expect(user).not_to be_valid
      end

      it 'is not too short' do
        user = build :user, name: 'a' * 2
        expect(user).not_to be_valid
      end

      it 'is not too long' do
        user = build :user, name: 'a' * 101
        expect(user).not_to be_valid
      end
    end

    describe 'email' do
      it 'is present' do
        user = build :user, email: ''
        expect(user).not_to be_valid
      end

      it 'is not too long' do
        user = build :user, email: 'a' * 250 + '@example.com'
        expect(user).not_to be_valid
      end

      it 'is unique' do
        existing_user = create :user
        new_user = build :user, email: existing_user.email
        expect(new_user).not_to be_valid
      end

      it 'accepts valid addresses' do
        %w(
          user@example.com
          USER@foo.COM
          A_US-ER@foo.bar.org
          first.last@foo.jp
          alice+bob@baz.cn
        ).each do |email|
          user = build :user, email: email
          expect(user).to be_valid
        end
      end

      it 'rejects invalid addresses' do
        %w(
          user@example,com
          user_at_foo.org
          user.name@example.
          foo@bar_baz.com
          foo@bar+baz.com
        ).each do |email|
          user = build :user, email: email
          expect(user).not_to be_valid
        end
      end
    end

    describe 'password' do
      it 'is present' do
        user = build :user, password_confirmation: ''
        expect(user).not_to be_valid
      end

      it 'is not too short' do
        user = build :user, password_confirmation: 'a' * 5
        expect(user).not_to be_valid
      end

      it 'is not too long' do
        user = build :user, password_confirmation: 'a' * 50
        expect(user).not_to be_valid
      end
    end
  end
end
