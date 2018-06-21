class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  def initialize
    @errors = []
  end

  private

  def set_todo(todo_id = :todo_id)
    @todo ||= Todo.find_by(id: params[todo_id])

    unless @todo
      @errors << I18n.t("mongoid.errors.models.todo.unknown")
      json_response(@errors, :not_found)
    end
  end
end
