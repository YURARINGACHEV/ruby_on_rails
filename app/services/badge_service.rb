class BadgeService

	def initialize(test_user, user)
    @test_user = test_user
    @user = @test_user.user
	end	

  def call
    Badge.all.each do |badge|
      @user.badges << badge  if send(badge.rule, badge.value)
 
    end
  end

	def category_complete_award?(category_title)  
    tests_ids_from_categories = Test.order_mas_id(category_title).uniq
    success_tests_ids_from_categories = TestUser.tests_success.where(user: @user, test: tests_ids_from_categories).pluck(:test_id).uniq 
    success_tests_ids_from_categories == tests_ids_from_categories
  end

  def tests_of_a_certain_level_award?(level)
    level_tests_ids = Test.where(level: level).pluck(:id)
    success_level_tests_ids = TestUser.tests_success.where(user: @user, test: level_tests_ids).pluck(:test_id).uniq
    success_level_tests_ids== level_tests_ids 
  end

  def on_the_first_try_award?(number)
    TestUser.tests_success.where(user: @user, test: @test_user.test).count == 1
  end

end

