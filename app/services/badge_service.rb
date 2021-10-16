class BadgeService

	def initialize(test_user, user)
    @test_user = test_user
    @user = @test_user.user

    call
	end	

  def call
    Badge.all.each do |badge|
      @user.badges << badge  if send(badge.rule, badge.value)
 
    end
  end

	def category_complete_award?(category_title)
    
    category_id = Test.order_mas_id(category_title).uniq
    c_id = TestUser.where(user: @test_user.user, test: Test.order_mas_id("Rails")).where(successful_tests: true).pluck(:test_id).uniq 
    return true if c_id == category_id
  end

  def tests_of_a_certain_level_award?(level)
    value_level = Test.where(level: level).pluck(:id)
    level = TestUser.where(successful_tests: true).where(user: @user, test: Test.where(level: level).pluck(:id)).pluck(:test_id).uniq

    return true if value_level == level
  end

  def on_the_first_try_award?(number)
    return true if TestUser.where(user: @test_user.user, test: @test_user.test).count == 1
  end

end
