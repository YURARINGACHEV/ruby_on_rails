class BadgeService

	def initialize(test_user, user, test, badge)
    @test_user = test_user
    @user = user
    @test = test
    @badge = badge
	end	

	def category_complete
		return true if @test_user.test.category.title == @badge.value
  end

  def tests_of_a_certain_level
  	return true if @test_user.test.level == @badge.value
  end

  def on_the_first_try
  	@test_user.numberя_of_attempts(@user.id, @test.id) == @badge.value
  end

end
										

