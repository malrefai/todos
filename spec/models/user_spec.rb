require "rails_helper"

# Test suite for User model
RSpec.describe User, type: :model do
  context "assertions for" do
    # ensure document, timestamp and User model has a 1:m relationship with the Todos model
    it { should be_mongoid_document }
    it { should have_timestamps }
    it { should have_fields(:name, :email, :password_digest) }
    it { should validate_associated(:todos) }
  end
  context "validations for" do
    # ensure name, email and password_digest are present before save
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
  end
end
