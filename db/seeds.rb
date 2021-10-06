# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{title: "Rails"},
                              {title: "Ruby"},
                              {title: "SQL"},
                              {title: 'Rest'}])


users = User.create!([{name: "Gerrard", email: 'yura.ryngachev@gmail.com', password: '123456', type: "Admin", first_name: 'GuruAdmin', last_name: 'Gurov'},
                     {name: "Lampard", email: 'iorik@list.ru', password: '123456', first_name: 'GuruUser', last_name: 'Testov'}])


tests = Test.create!([{author: users[0], title: "Rails", level: "4", category_id: categories[0].id},
                     {author: users[1], title: "Rail", level: "4", category_id: categories[0].id},
                     {author: users[2], title: "Ruby", level: "2", category_id: categories[1].id},
                     {author: users[3], title: "SQL", level: "1", category_id: categories[2].id}])




questions = Question.create!([{body: "Как вывести список всех Тестов,которые проходит или когда-либо проходил Пользователь", test_id: tests[0].id},
                             {body: "Вывести название всех тестов с определенной категории", test_id: tests[1].id},
                             {body: "как объеденить с помощью joins", test_id: tests[3].id},
                             {body: "как объеденить с помощью joins", test_id: tests)
 

answers = Answer.create!([{correct: true, question_id: questions[0].id, body: "an1"},
                         {correct: false, question_id: questions[0].id, body: "an2"},
                         {correct: true, question_id: questions[0].id, body: "an3"},
                         {correct: false, question_id: questions[1].id, body: "an4"},
                         {correct: false, question_id: questions[1].id, body: "an5"},
                         {correct: false, question_id: questions[1].id, body: "an6"}])

test_users = TestUser.create!([{user_id: users[0].id, test_id: tests[0].id},
                              {user_id: users[0].id, test_id: tests[1].id},
                              {user_id: users[2].id, test_id: tests[2].id},
                             {user_id: users[1].id, test_id: tests[3].id}])

