class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  # fields
  field :name, type: String
  field :done, type: Mongoid::Boolean

  # associations
  belongs_to :todo

  # validations
  validates_presence_of :name, :done
end
