class ItemsController < ApplicationController
  before_action :set_todo
  before_action :set_todo_item, only: %i[show update destroy]

  def index
    @items = @todo.items
    json_response(@items, :ok)
  end

  def show
    json_response(@item, :ok)
  end

  def create
    @item = @todo.items.new(item_params)

    if @item.valid?
      @item.save
      json_response(@item, :created)
    else
      @errors << I18n.t("mongoid.errors.models.item.create")
      json_response(@errors, :unprocessable_entity)
    end
  end

  def update
    if @item.update(item_params)
      json_response(@item, :ok)
    else
      @errors << I18n.t("mongoid.errors.models.item.update")
      json_response(@errors,:unprocessable_entity)
    end
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def set_todo_item
    @item ||= @todo&.items.find_by(id: params[:id])
    unless @item
      @errors << I18n.t("mongoid.errors.models.item.unknown")
      json_response(@errors, :not_found)
    end
  end

  def item_params
    params.permit(:name, :done)
  end
end
