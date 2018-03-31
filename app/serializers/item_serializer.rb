class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :done, :updated_at
end
