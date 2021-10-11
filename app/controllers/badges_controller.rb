class BadgesController < ApplicationController
  
  before_action :authenticate_user!
  # before_action :all_badge, only: [:index] 

  def index
    @badge = current_user.badges
  end

  private
  
  def all_badge
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

end
