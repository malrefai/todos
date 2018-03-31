RSpec.shared_examples "invalid_parameter" do |status, error_message|
  it "returns 'application/json' for header content type" do
    expect(response.content_type).to eq("application/json")
  end
  it "returns '#{status}' for status code" do
    expect(response).to have_http_status(status)
  end
  it "returns error message" do
    expect(response.body).to include(error_message)
  end
  it "matches error schema" do
    expect(parsed_json).to match_response_schema("errors/schema_errors")
  end
end
