class Item
  include Mongoid::Document
  field :name, type: String
  field :done, type: Mongoid::Boolean
  embedded_in :todo
end
