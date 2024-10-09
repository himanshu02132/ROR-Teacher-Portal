require 'faker'

puts "Seeding students, subjects, and marks..."

# Predefined subject names
subject_names = ["Mathematics", "English", "Biology", "Physics", "Chemistry", "History", "Geography", "Computer Science", "Art", "Physical Education"]

# Create 25 students with random names, each having subjects and marks
25.times do
  # Create a student with a random name
  student = Student.create!(
    name: Faker::Name.last_name,
    subject_name: subject_names.sample(1).first,
    marks: rand(50..100) # Generates a random last name for the student
  )
end

User.create(email: 'test.admin@gmail.com', password: 'test123')

puts "Seeding completed!"
