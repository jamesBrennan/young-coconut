class AddOrderToRoutineSet < ActiveRecord::Migration
  def up
    add_column :routine_sets, :order, :integer
  end

  def down
    remove_column :routine_sets, :order, :integer
  end
end
