require "rails_helper"

RSpec.describe Todo, type: :model do
  context "validations for" do
    it { should be_mongoid_document }
    it { should have_timestamps }
    it { should have_fields(:title, :created_by) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:created_by) }
  end
end
