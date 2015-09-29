ActiveRecord::Schema.define(:version => 20120521144648) do
  create_table "exercises", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "metrics"
  end

  create_table "routine_sets", :force => true do |t|
    t.integer  "routine_id"
    t.integer  "exercise_id"
    t.string   "instructions"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "routines", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "order"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "workout_sets", :force => true do |t|
    t.integer  "workout_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "routine_set_id"
    t.string   "metrics"
  end

  create_table "workouts", :force => true do |t|
    t.integer  "routine_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "completed"
    t.integer  "user_id"
  end

end
