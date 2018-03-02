require "rails_helper"

RSpec.describe TodosController, type: :controller do
  # initialize test data
  let!(:todos) { FactoryBot.create_list(:todo, 10) }
  let(:todo_id) { todos.first.id }

  # test suite for GET /api/todos
  describe "GET #index" do
    # make HTTP get request before each example
    before { get :index }

    it "returns todos" do
      # Note `json` is a custom helper to parse JSON response
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(:ok)
    end
  end

  # test suite for GET /api/todos/:id
  describe "GET #show" do
    before { get :show, params: { id: todo_id } }

    context "when the record exists" do
      it "returns the todo" do
        expect(json).not_to be_empty
        expect(json["_id"]["$oid"]).to eq(todo_id.to_s)
      end
      it "returns status code 200" do
        expect(response).to have_http_status(:ok)
      end
    end
    context "when the record does not exist" do
      let(:todo_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(:not_found)
      end
      it "returns a not found message" do
        expect(response.body).to match(/not found for class Todo /)
      end
    end
  end

  # test suite for POST /api/todos
  describe "POST #create" do
    # valid payload
    let(:valid_attributes) { { title: "Learn Elm", created_by: "1" } }

    context "when the request is valid" do
      before { post :create, params: valid_attributes }

      it "creates a todo" do
        expect(json["title"]).to eq("Learn Elm")
      end
      it "returns status code 201" do
        expect(response).to have_http_status(:created)
      end
    end
    context "when the request is invalid" do
      before { post :create, params: { title: "Foobar" } }

      it "returns status code 422" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
      it "returns a validation failure message" do
        expect(response.body).
          to match(/Created by can't be blank/)
      end
    end
  end

  # test suite for PUT /api/todos/:id
  describe "PUT #update" do
    let(:valid_attributes) { { id: todo_id, title: "Shopping" } }

    context "when the record exists" do
      before { put :update, params: valid_attributes }

      it "updates the record" do
        expect(response.body).to be_empty
      end
      it "returns status code 204" do
        expect(response).to have_http_status(:no_content)
      end
    end
  end

  # test suite for DELETE /api/todos/:id
  describe "DELETE #destroy" do
    before { delete :destroy, params: { id: todo_id } }

    it "returns status code 204" do
      expect(response).to have_http_status(:no_content)
    end
  end
end
