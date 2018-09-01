require 'rails_helper'

RSpec.describe Contribution, :type => :model do
  it { should belong_to(:contributor) }
  it { should belong_to(:repo) }
end
