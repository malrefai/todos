class TodosController < ApplicationController
  before_action -> { set_todo(:id) }, only: %i[show update destroy]

  def index
    @todos = Todo.all
    json_response(@todos, :ok)
  end

  def show
    json_response(@todo, :ok)
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.valid?
      @todo.save
      json_response(@todo, :created)
    else
      @errors << I18n.t("mongoid.errors.models.todo.create")
      json_response(@errors, :unprocessable_entity)
    end
  end

  def update
    if @todo.update(todo_params)
      json_response(@todo, :ok)
    else
      @errors << I18n.t("mongoid.errors.models.todo.update")
      json_response(@errors, :unprocessable_entity)
    end
  end

  def destroy
    @todo.destroy
    head :no_content
  end

  private

  # strong params, white list params
  def todo_params
    params.permit(:title, :created_by)
  end
end
