class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def index_user
    @badges = current_user.badges
  end
end
