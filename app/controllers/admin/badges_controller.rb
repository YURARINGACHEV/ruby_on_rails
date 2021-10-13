class Admin::BadgesController < Admin::BaseController

  before_action :authenticate_user!

  before_action :all_badge, only: %i[index] 
  before_action :find_badge, only: [:show, :destroy, :edit, :update]

  def index

  end

  def show
  
  end
 
  def new
    @badge = Badge.new
  end


  def create
    @badge = Badge.new(badge_params)
   
    if @badge.save
      redirect_to [:admin, @badge], notice: "Бэйдж создан"
    else
      render :new
    end
  end

  # def edit

  # end

  # def update
 
  #   if @badge.update(badge_params)
  #     redirect_to [:admin, @badge]
  #   else
  #     render :edit
  #   end
  # end
  
  # def destroy
  #   @badge.destroy    
  #   redirect_to admin_badges_path
  # end

  private
  
  def all_badge
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit( :title, :image_url, :rule, :value)
  end

end
