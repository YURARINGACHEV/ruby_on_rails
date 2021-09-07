class TestsMailer < ApplicationMailer

  def completed_test(test_user)
  	@user = test_user.user
  	@test = test_user.test
  	mail to: @user.email
  end

end
