require "rails_helper"

RSpec.describe TodosController, type: :controller do
  # initialize test data
  let!(:todos) { FactoryBot.create_list(:todo, 10) }
  let!(:todo) { todos.first }
  let!(:old_todos_count) { Todo.all.count }
  let(:todo_id) { todo.id }
  let(:title) { Faker::FamilyGuy.character }
  let(:created_by) { Faker::Number.number(10) }

  # test suite for GET /api/todos
  describe "GET #index" do
    let(:params) { { } }

    context "when the request is valid" do
      # make HTTP get request before each example
      before { get :index, params: params }

      include_examples "valid_request",
                       :ok,
                       "todos_api/schema_index"

      it "returns all objects" do
        # Note `json` is a custom helper to parse JSON response
        expect(parsed_json.size).to eq(todos.size)
      end
    end
    context "when the request is invalid" do
      context "unauthorized user" do
        # include_examples "unauthorized_user",
        #                  :get,
        #                  :index
      end
    end
  end

  # test suite for GET /api/todos/:id
  describe "GET #show" do
    let(:params) do
      {
          id: todo_id,
      }
    end

    context "when the request is valid" do
      before { get :show, params: params }

      include_examples "valid_request",
                       :ok,
                       "todos_api/schema_show"
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
    end
  end

  # test suite for POST /api/todos
  describe "POST #create" do
    let(:params) do
      {
          title: title,
          created_by: created_by,
      }
    end

    context "when the request is valid" do
      before { post :create, params: params }


      include_examples "valid_request",
                       :created,
                       "todos_api/schema_create"

      it "creates object in the database" do
        expect(Todo.all.count).to eq old_todos_count + 1
      end
    end
    context "when the request is invalid" do
      context "unauthorized user" do
        # include_examples "unauthorized_user",
        #                  :post,
        #                  :create
      end
      context "invalid title parameter" do
        let(:title) { "" }
        before do
          post :create, params: params
        end

        include_examples "invalid_parameter",
                         :unprocessable_entity,
                         I18n.t("mongoid.errors.models.todo.create")
      end
      context "invalid created_by parameter" do
        let(:created_by) { "" }
        before do
          post :create, params: params
        end

        include_examples "invalid_parameter",
                         :unprocessable_entity,
                         I18n.t("mongoid.errors.models.todo.create")
      end
    end
  end

  # test suite for PUT /api/todos/:id
  describe "PUT #update" do
    let(:params) do
      {
          id: todo_id,
          title: title,
          created_by: created_by,
      }
    end

    context "when the request is valid" do
      before { put :update, params: params }


      include_examples "valid_request",
                       :ok,
                       "todos_api/schema_update"

      # it "updates object in the database" do
      #   expect(assigns(:todo)).to eq
      # end
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
      context "invalid title parameter" do
        let(:title) { "" }
        before do
          put :update, params: params
        end

        include_examples "invalid_parameter",
                         :unprocessable_entity,
                         I18n.t("mongoid.errors.models.todo.update")
      end
      context "invalid created_by parameter" do
        let(:created_by) { "" }
        before do
          put :update, params: params
        end

        include_examples "invalid_parameter",
                         :unprocessable_entity,
                         I18n.t("mongoid.errors.models.todo.update")
      end
    end
  end

  # test suite for DELETE /api/todos/:id
  describe "DELETE #destroy" do
    let(:params) do
      {
          id: todo_id,
      }
    end

    context "when the request is valid" do
      before { delete :destroy, params: params }

      include_examples "delete_request"

      it "deletes object from the database" do
        expect(Todo.all.count).to eq old_todos_count - 1
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
    end
  end
end
