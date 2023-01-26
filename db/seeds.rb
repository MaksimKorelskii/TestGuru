# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([
    { title: 'Backend' },
    { title: 'Frontend' },
    { title: 'Fullstack' }
  ])

users = User.create!([
    { first_name: 'Peter', email: "peter@example.com", password: 'qwe123', password_confirmation: 'qwe123' },
    { first_name: 'Lois', email: "lois@example.com", password: 'qwe123', password_confirmation: 'qwe123' },
    { first_name: 'Maksim', email: "maksim@example.com", password: 'qwe123', password_confirmation: 'qwe123' },
    { first_name: 'Andrey', email: "andrey@example.com", password: 'qwe123', password_confirmation: 'qwe123' }
  ])

tests = Test.create!([
    { title: 'Basic Ruby Test', level: 1, author: users[0], category: categories[0] },
    { title: 'Basic JavaScript Test', level: 1, author: users[3], category: categories[1] },
    { title: 'Ruby on Rails', level: 2, author: users[2], category: categories[2] },
    { title: 'Pyton', level: 3, author: users[1], category: categories[2] }
  ])

questions = Question.create!([
    { body: 'Where Great Khan at Boulder City tells you to go to meet with Benny?', test: tests[2] },
    { body: 'Who was one of the founders of Caesars Legion?', test: tests[2] },
    { body: 'What does frozen string literal do?', test: tests[0] },
    { body: 'Whats object_id?', test: tests[0] },
    { body: 'Whats the name of the temple where you start the game?', test: tests[3] },
    { body: 'Are there classes in JavaScript?', test: tests[1] },
    { body: 'Whats JavaScript?', test: tests[1] }
  ])

Answer.create!([
    { body: 'Tops', correct: true, question: questions[0] },
    { body: 'Luxe', correct: false, question: questions[0] },
    { body: 'Goodsprings', correct: false, question: questions[0] },
    { body: 'Joshua Graham', correct: true, question: questions[1] },
    { body: 'Ulysses', correct: false, question: questions[1] },
    { body: 'Mr. House', correct: false, question: questions[1] },
    { body: 'Freezes all strings', correct: true, question: questions[2] },
    { body: 'There for beauty', correct: false, question: questions[2] },
    { body: 'Memory address where object is stored', correct: true, question: questions[3] },
    { body: 'Length of an object', correct: false, question: questions[3] },
    { body: 'Temple of Trials', correct: true, question: questions[4] },
    { body: 'Detention Temple', correct: false, question: questions[4] },
    { body: 'Yes', correct: true, question: questions[5] },
    { body: 'No', correct: false, question: questions[5] },
    { body: 'Programming language', correct: true, question: questions[6] },
    { body: 'Python framework', correct: false, question: questions[4] }
  ])

TestPassage.create!([
    { test: tests[0], user: users[0] },
    { test: tests[1], user: users[1] },
    { test: tests[2], user: users[1] },
    { test: tests[3], user: users[2] },
    { test: tests[0], user: users[2] },
    { test: tests[1], user: users[2] },
    { test: tests[0], user: users[3] }
  ])
