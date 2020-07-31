class BadgesController < ApplicationController
  before_action :find_badge, only: %i[show]

  def index
    @badges = current_user.badges
  end

  def show
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
