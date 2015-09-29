class Routine < ActiveRecord::Base
  has_many :routine_sets
  has_many :exercises, through: :routine_sets
end
