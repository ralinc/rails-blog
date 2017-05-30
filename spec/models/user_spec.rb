require 'rails_helper'

describe User do
  subject { create :user }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should allow_value('test@example.com').for(:email) }
  it { should_not allow_value('test').for(:email) }
end
