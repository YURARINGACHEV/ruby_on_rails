# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# # Создайте набор начальных данных для всех существующих моделей в файле db/seeds.rb
# Создайте метод класса в модели Test, который возвращает отсортированный по убыванию
#  массив названий всех Тестов у которых Категория называется определённым образом 
#  (название категории передается в метод в качестве аргумента).

tests = Test.create(title: "Rails",
                    level: "2")
tests = Test.create(title: "Rails",
                    level: "3")
tests = Test.create(title: "Ruby",
                    level: "2")

tests = Test.create(title: "SQL",
                    level: "3")


categories = Category.create(title: "Rails.Интерфейс запросов Active Record")
categories = Category.create(title: "Rails")

users = User.create(name: "Gerrard")

answers = Answer.create(correct: true)

questions = Question.create(body: "Как вывести список всех Тестов,которые проходит или когда-либо проходил Пользователь")