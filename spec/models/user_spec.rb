require 'rails_helper'

RSpec.describe Contributor, :type => :model do
  subject { described_class.new(name: "Benson") }

  describe "Validations" do
    it "is valid when provided valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should have_many(:contributions) }
    it { should have_many(:repos).through(:contributions) }
  end
end
