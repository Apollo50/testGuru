class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show destroy]


  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(set_badge)

    if @badge.save
      redirect_to admin_badges_path
    else
      render new
    end

  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path

  end

  private

  def set_badge
    params.require(:badge).permit(:title, :img_url, :rule_name )
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
