# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{title: "Rails.Интерфейс запросов Active Record"},
                              {title: "Ruby"},
                              {title: "SQL"}])

tests = Test.create([{title: "Rails", level: "2", category_id: categories[0].id},
                     {title: "Rails", level: "3", category_id: categories[0].id},
                     {title: "Ruby", level: "2", category_id: categories[1].id},
                     {title: "SQL", level: "1", category_id: categories[2].id}])


questions = Question.create([{body: "Как вывести список всех Тестов,которые проходит или когда-либо проходил Пользователь", test_id: tests[0].id},
                             {body: "Вывести название всех тестов с определенной категории", test_id: tests[1].id},
                             {body: "как объеденить с помощью joins", test_id: tests[3].id}])
 

answers = Answer.create([{correct: true, question_id: questions[0].id},
                         {correct: false, question_id: questions[0].id},
                         {correct: true, question_id: questions[1].id},
                         {correct: false, question_id: questions[1].id},
                         {correct: true, question_id: questions[2].id},
                         {correct: false, question_id: questions[2].id}])

users = User.create([{name: "Gerrard"},
                     {name: "Fill"},
                     {name: "Saka"}])


test_users = TestUser.create([{user_id: users[0].id, test_id: tests[0].id},
                              {user_id: users[0].id, test_id: tests[1].id},
                              {user_id: users[2].id, test_id: tests[2].id},
                             {user_id: users[1].id, test_id: tests[3].id}])