RSpec.shared_examples "unauthorized_user" do |method, action|
  let(:unauthorized_user) { FactoryGirl.create(:user) }
  before do
    # stub_current_user(unauthorized_user)
    send(method, action, params: params)
  end

  it "returns 'application/json' for header content type" do
    expect(response.content_type).to eq("application/json")
  end
  it "returns 'unauthorized' unauthorized" do
    expect(response).to have_http_status(:unauthorized)
  end
  it "matches error schema" do
    expect(parsed_json).to match_response_schema("errors/schema_unauthorized")
  end
end
