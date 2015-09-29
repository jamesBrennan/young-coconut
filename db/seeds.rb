# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_routine_set(name, routine, inst = "15-20 reps")
  RoutineSet.create :routine => routine, :exercise => Exercise.find_by_name(name), :instructions => inst
end

Exercise.destroy_all
Routine.destroy_all
Workout.destroy_all
User.destroy_all

User.create(name: "James")

Exercise.create(["Ballet Squats", "Bent-over Lateral", "Concentration Curls", "Crunches", "Dumbbell Lunges", "Dumbbell Pullover",
                 "Dumbbell Rows", "Dumbbell Shoulder Press", "Dumbbell Curls", "Dumbbell Squats", "Incline Dumbbell Flys",
                 "Incline Dumbbell Press", "Leg Curls", "Leg Extensions", "Lying Dumbbell Extension", "Pushups",
                 "Standing Calf Raises (one leg)", "Standing Calf Raises (two leg)", "Standing Leg Lifts", "Stiff-legged Deadlifts",
                 "Tricep kickbacks", "Two Arm Rows"].map{|n| {:name => n}})

break_in_a = Routine.create(:name => "Break In A")
break_in_a_alt = Routine.create(:name => "Break In A (alt)")
break_in_b = Routine.create(:name => "Break In B")
break_in_b_alt = Routine.create(:name => "Break In B (alt)")

create_routine_set("Dumbbell Rows", break_in_a)
create_routine_set("Incline Dumbbell Press", break_in_a)
create_routine_set("Dumbbell Rows", break_in_a)
create_routine_set("Incline Dumbbell Press", break_in_a)
create_routine_set("Dumbbell Pullover", break_in_a)
create_routine_set("Incline Dumbbell Flys", break_in_a)
create_routine_set("Dumbbell Pullover", break_in_a)
create_routine_set("Incline Dumbbell Flys", break_in_a)
create_routine_set("Dumbbell Curls", break_in_a)
create_routine_set("Lying Dumbbell Extension", break_in_a)
create_routine_set("Dumbbell Curls", break_in_a)
create_routine_set("Lying Dumbbell Extension", break_in_a)
create_routine_set("Concentration Curls", break_in_a)
create_routine_set("Tricep kickbacks", break_in_a)
create_routine_set("Concentration Curls", break_in_a)
create_routine_set("Tricep kickbacks", break_in_a)

create_routine_set("Two Arm Rows", break_in_a_alt)
create_routine_set("Incline Dumbbell Press", break_in_a_alt)
create_routine_set("Two Arm Rows", break_in_a_alt)
create_routine_set("Incline Dumbbell Press", break_in_a_alt)
create_routine_set("Dumbbell Pullover", break_in_a_alt)
create_routine_set("Pushups", break_in_a_alt)
create_routine_set("Dumbbell Pullover", break_in_a_alt)
create_routine_set("Pushups", break_in_a_alt)
create_routine_set("Dumbbell Curls", break_in_a_alt)
create_routine_set("Lying Dumbbell Extension", break_in_a_alt)
create_routine_set("Dumbbell Curls", break_in_a_alt)
create_routine_set("Lying Dumbbell Extension", break_in_a_alt)
create_routine_set("Concentration Curls", break_in_a_alt)
create_routine_set("Tricep kickbacks", break_in_a_alt)
create_routine_set("Concentration Curls", break_in_a_alt)
create_routine_set("Tricep kickbacks", break_in_a_alt)

create_routine_set("Dumbbell Squats", break_in_b)
create_routine_set("Leg Curls", break_in_b)
create_routine_set("Dumbbell Squats", break_in_b)
create_routine_set("Leg Curls", break_in_b)
create_routine_set("Ballet Squats", break_in_b)
create_routine_set("Stiff-legged Deadlifts", break_in_b)
create_routine_set("Ballet Squats", break_in_b)
create_routine_set("Stiff-legged Deadlifts", break_in_b)
create_routine_set("Standing Calf Raises (one leg)", break_in_b)
create_routine_set("Dumbbell Shoulder Press", break_in_b)
create_routine_set("Standing Calf Raises (one leg)", break_in_b)
create_routine_set("Dumbbell Shoulder Press", break_in_b)
create_routine_set("Standing Calf Raises (two leg)", break_in_b)
create_routine_set("Bent-over Lateral", break_in_b)
create_routine_set("Standing Calf Raises (two leg)", break_in_b)
create_routine_set("Bent-over Lateral", break_in_b)

create_routine_set("Ballet Squats", break_in_b_alt)
create_routine_set("Dumbbell Lunges", break_in_b_alt)
create_routine_set("Ballet Squats", break_in_b_alt)
create_routine_set("Dumbbell Lunges", break_in_b_alt)
create_routine_set("Leg Extensions", break_in_b_alt)
create_routine_set("Leg Curls", break_in_b_alt)
create_routine_set("Leg Extensions", break_in_b_alt)
create_routine_set("Leg Curls", break_in_b_alt)
create_routine_set("Standing Calf Raises (one leg)", break_in_b_alt)
create_routine_set("Dumbbell Shoulder Press", break_in_b_alt)
create_routine_set("Standing Calf Raises (one leg)", break_in_b_alt)
create_routine_set("Dumbbell Shoulder Press", break_in_b_alt)
create_routine_set("Standing Calf Raises (two leg)", break_in_b_alt)
create_routine_set("Bent-over Lateral", break_in_b_alt)
create_routine_set("Standing Calf Raises (two leg)", break_in_b_alt)
create_routine_set("Bent-over Lateral", break_in_b_alt)
