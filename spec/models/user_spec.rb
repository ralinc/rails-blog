require 'rails_helper'

describe User do
  it 'email is saved as lowercased' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    user = create :user, email: mixed_case_email
    expect(user.email).to eq(mixed_case_email.downcase)
  end

  it { should validate_presence_of(:name) }
  it { should_not allow_value('a' * 2).for(:name) }
  it { should_not allow_value('a' * 101).for(:name) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should_not allow_value("#{'a' * 250}@example.com").for(:email) }

  %w(
    user@example.com
    USER@foo.COM
    A_US-ER@foo.bar.org
    first.last@foo.jp
    alice+bob@baz.cn
  ).each do |email|
    it { should allow_value(email).for(:email) }
  end

  %w(
    user@example,com
    user_at_foo.org
    user.name@example.
    foo@bar_baz.com
    foo@bar+baz.com
  ).each do |email|
    it { should_not allow_value(email).for(:email) }
  end
end
