RSpec.shared_examples "delete_request" do
  it "returns 'no_content' for status code" do
    expect(response).to have_http_status(:no_content)
  end
end
