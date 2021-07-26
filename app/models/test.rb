# Создайте метод класса в модели Test, который возвращает отсортированный 
# по убыванию массив названий всех Тестов у которых Категория называется
#  определённым образом (название категории передается в метод в качестве аргумента).



class Test < ApplicationRecord

  def self.order_mas_title(title)
    # Test.joins('join categories on categories.id = tests.category_id').where(categories: { title: 'Rails' }).order(title: :DESC).pluck('tests.title')
    Category.joins(:tests).where("title = ?", title).order(id: :DESC)
  end

end
