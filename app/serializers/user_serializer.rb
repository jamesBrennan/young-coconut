class UserSerializer < BaseSerializer
  attribute :id
  attribute :name

  has_many :workouts
end
