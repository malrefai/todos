class Todo
  include Mongoid::Document
  field :title, type: String
  field :created_by, type: String
end
