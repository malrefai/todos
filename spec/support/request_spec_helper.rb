module RequestSpecHelper
  # Parse JSON response to ruby hash
  def parsed_json
    JSON.parse(response.body)
  end
end
