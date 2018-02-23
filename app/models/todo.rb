class Todo
  include Mongoid::Document
  include Mongoid::Timestamps

  # fields
  field :title, type: String
  field :created_by, type: String

  # associations
  embeds_many :items

  # validations
  validates_presence_of :title, :created_by
end
