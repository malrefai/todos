require "rails_helper"

RSpec.describe Item, type: :model do
  context "validations for" do
    it { should be_mongoid_document }
    it { should have_timestamps }
    it { should have_fields(:name, :done) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:done) }
  end
end
