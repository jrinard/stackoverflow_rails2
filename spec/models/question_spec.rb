require 'rails_helper'

describe Question do
  it { should validate_presence_of :query }
  it { should belong_to :user }
end
