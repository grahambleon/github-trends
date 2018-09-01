require 'rails_helper'

RSpec.describe Repo, :type => :model do
  subject { described_class.new(title: "Test Title", description: "Test Description") }

  describe "Validations" do
    it "is valid when provided valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a description" do
      subject.description = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should have_many(:contributions) }
    it { should have_many(:contributors).through(:contributions) }
  end
end
