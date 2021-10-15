class BadgeService

	def initialize(test_user, user)
    @test_user = test_user
    @user = user

    call
	end	

  def call
    Badge.all.each do |badge|
      @user.badges << badge if send(badge.rule, badge.value)
    end
  end

	def category_complete_award?(category_title)
    category_id = Test.order_mas_title(category_title).uniq
		TestUser.tests_success(@test_user.user, @test_user.test) == category_id
  end

  def tests_of_a_certain_level_award?(level)
    @test_user.test.level == level
  end

  def on_the_first_try_award?(number)
  	TestUser.where(user: @test_user.user, test: @test_user.test).count == number
  end

end
										

# s = TestUser.where(user: 2, test: Test.order_mas_title("Rails")).where(successful_tests: "t").pluck(:test_id).uniq

# t=Test.order_mas_title("Rails")
