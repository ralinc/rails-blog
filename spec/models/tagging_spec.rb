require 'rails_helper'

describe Tagging do
  it { should belong_to(:article) }
  it { should belong_to(:tag) }
end
