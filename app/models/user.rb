# Создайте инстанс-метод в модели User,
# который принимает в качестве аргумента значение
# уровня сложности и возвращает список всех Тестов,
# которые проходит или когда-либо проходил Пользователь на этом уровне сложности
class User < ApplicationRecord
  def show_list_test(level)
    Test.joins('join test_users on tests.id = test_users.test_id').where(tests: { level: level })

  end

end
