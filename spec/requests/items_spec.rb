require "rails_helper"

RSpec.describe "Items API", type: :request do
  # initialize the test data
  let!(:todo) { FactoryBot.create(:todo) }
  let(:todo_id) { todo.id }
  let!(:items) { FactoryBot.create_list(:item, 20, todo_id: todo_id) }
  let(:id) { items.first.id }

  # test suite for GET api/todos/:todo_id/items
  describe "GET #index" do
    before { get :index }

    context "when todo exists" do
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
      it "returns all todo items" do
        expect(json.size).to eq(20)
      end
    end
    context "when todo does not exist" do
      let(:todo_id) { 0 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

  # test suite for GET api/todos/:todo_id/items/:id
  describe "GET #show" do
    before { get :show, params: { todo_id: todo_id, id: id } }

    context "when todo item exists" do
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
      it "returns the item" do
        expect(json["id"]).to eq(id)
      end
    end
    context "when todo item does not exist" do
      let(:id) { 0 }

      it "return status code 404" do
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # test suite for POST api/todos/:todo_id/items
  describe "POST #create" do
    let(:valid_attributes) { { todo_id: todo_id, name: "Visit Narnia", done: false } }

    context "when request attributes are valid" do
      before { post :create, params: valid_attributes }

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end
    context "when an invalid request" do
      before { post :create, params: { todo_id: todo_id } }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
      it "returns a failure message" do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # test suite for PUT api/todos/:todo_id/items/:id
  describe "PUT #update" do
    let(:valid_attributes) { { todo_id: todo_id, id: id, name: "Mozart" } }

    before { put :update, params: valid_attributes }

    context "when item exists" do
      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
      it "update the item" do
        updated_item = Item.find(id)
        expect(updated_item.name).to match(/Mozart/)
      end
    end
    context "when the item does not exist" do
      let(:id) { 0 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # test suite for DELETE /todos/:id
  describe "DELETE #destroy" do
    before { delete :destroy, params: { todo_id: todo_id, id: id } }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end