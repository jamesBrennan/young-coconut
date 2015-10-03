class Routine < ActiveRecord::Base
  has_many :routine_sets
end

class RoutineSet < ActiveRecord::Base
  belongs_to :routine
end

class MigrateOrderForRoutineSets < ActiveRecord::Migration
  def up
    sets_by_routine = Routine.all.map { |routine| routine.routine_sets.order(id: :asc) }
    sets_by_routine.each do |sets|
      sets.each_with_index do |set, index|
        set.update_attribute(:order, index)
      end
    end
  end

  def down
    RoutineSet.update_all(order: nil)
  end
end
