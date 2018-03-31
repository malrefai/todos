require "rails_helper"

RSpec.describe ItemsController, type: :controller do
  # initialize the test data
  let!(:todo) { FactoryBot.create(:todo) }
  let!(:items) { FactoryBot.create_list(:item, 20, todo: todo) }
  let!(:item) { items.first }
  let!(:old_items_count) { Item.all.count }
  let(:todo_id) { todo.id }
  let(:item_id) { item.id }
  let(:name) { Faker::Simpsons.character }
  let(:done) { Faker::Boolean.boolean }

  # test suite for GET api/todos/:todo_id/items
  describe "GET #index" do
    let(:params) do
      {
          todo_id: todo_id,
      }
    end

    context "when the request is valid" do
      # make HTTP get request before each example
      before { get :index, params: params }

      include_examples "valid_request",
                       :ok,
                       "items_api/schema_index"

      it "returns all objects" do
        # Note `json` is a custom helper to parse JSON response
        expect(parsed_json.size).to eq(items.size)
      end
    end
    context "when the request is invalid" do
      context "unauthorized user" do
        # include_examples "unauthorized_user",
        #                  :get,
        #                  :index
      end
      context "invalid todo parameter" do
        let(:todo_id) { "invalid_todo_id" }
        before { get :index, params: params }

        include_examples "invalid_parameter",
                         :not_found,
                         I18n.t("mongoid.errors.models.todo.unknown")
      end

    end
  end


  # test suite for GET api/todos/:todo_id/items/:id
  describe "GET #show" do
    let(:params) do
      {
          todo_id: todo_id,
          id: item_id,
      }
    end

    context "when the request is valid" do
      before { get :show, params: params }

      include_examples "valid_request",
                       :ok,
                       "items_api/schema_show"
    end
    context "when the request is invalid" do
      context "unauthorized user" do
        # include_examples "unauthorized_user",
        #                  :get,
        #                  :show
      end
      context "invalid todo parameter" do
        let(:todo_id) { "invalid_todo_id" }
        before { get :show, params: params }

        include_examples "invalid_parameter",
                         :not_found,
                         I18n.t("mongoid.errors.models.todo.unknown")
      end
      context "invalid item parameter" do
        let(:item_id) { "invalid_item_id" }
        before { get :show, params: params }

        include_examples "invalid_parameter",
                         :not_found,
                         I18n.t("mongoid.errors.models.item.unknown")
      end
    end
  end

  # test suite for POST api/todos/:todo_id/items
  describe "POST #create" do
    let(:params) do
      {
          todo_id: todo_id,
          name: name,
          done: done,
      }
    end

    context "when the request is valid" do
      before { post :create, params: params }


      include_examples "valid_request",
                       :created,
                       "items_api/schema_create"

      it "creates object in the database" do
        expect(Item.all.count).to eq old_items_count + 1
      end
    end
    context "when the request is invalid" do
      context "unauthorized user" do
        # include_examples "unauthorized_user",
        #                  :post,
        #                  :create
      end
      context "invalid todo parameter" do
        let(:todo_id) { "invalid_todo_id" }
        before { post :create, params: params }

        include_examples "invalid_parameter",
                         :not_found,
                         I18n.t("mongoid.errors.models.todo.unknown")
      end
      context "invalid name parameter" do
        let(:name) { "" }
        before do
          post :create, params: params
        end

        include_examples "invalid_parameter",
                         :unprocessable_entity,
                         I18n.t("mongoid.errors.models.item.create")
      end
    end
  end

  # test suite for PUT api/todos/:todo_id/items/:id
  describe "PUT #update" do
    let(:params) do
      {
          todo_id: todo_id,
          id: item_id,
          name: name,
          done: done,
      }
    end

    context "when the request is valid" do
      before { put :update, params: params }


      include_examples "valid_request",
                       :ok,
                       "items_api/schema_update"
    end
    context "when the request is invalid" do
      context "unauthorized user" do
        # include_examples "unauthorized_user",
        #                  :put,
        #                  :update
      end
      context "invalid todo parameter" do
        let(:todo_id) { "invalid_todo_id" }
        before { put :update, params: params }

        include_examples "invalid_parameter",
                         :not_found,
                         I18n.t("mongoid.errors.models.todo.unknown")
      end
      context "invalid item parameter" do
        let(:item_id) { "invalid_item_id" }
        before { put :update, params: params }

        include_examples "invalid_parameter",
                         :not_found,
                         I18n.t("mongoid.errors.models.item.unknown")
      end
      context "invalid name parameter" do
        let(:name) { "" }
        before do
          put :update, params: params
        end

        include_examples "invalid_parameter",
                         :unprocessable_entity,
                         I18n.t("mongoid.errors.models.item.update")
      end
    end
  end

  # test suite for DELETE /todos/:id
  describe "DELETE #destroy" do
    let(:params) do
      {
          todo_id: todo_id,
          id: item_id,
      }
    end

    context "when the request is valid" do
      before { delete :destroy, params: params }

      include_examples "delete_request"

      it "deletes object from the database" do
        expect(Item.all.count).to eq old_items_count - 1
      end
    end
    context "when the request is invalid" do
      context "unauthorized user" do
        # include_examples "unauthorized_user",
        #                  :delete,
        #                  :destroy
      end
      context "invalid contest parameter" do
        let(:todo_id) { "invalid_todo_id" }
        before { delete :destroy, params: params }

        include_examples "invalid_parameter",
                         :not_found,
                         I18n.t("mongoid.errors.models.todo.unknown")
      end
      context "invalid item parameter" do
        let(:item_id) { "invalid_item_id" }
        before { delete :destroy, params: params }

        include_examples "invalid_parameter",
                         :not_found,
                         I18n.t("mongoid.errors.models.item.unknown")
      end
    end
  end
end
