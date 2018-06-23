class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  # fields
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  # encrypt password
  has_secure_password

  # associations
  has_many :todos, dependent: :destroy

  # validations
  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
