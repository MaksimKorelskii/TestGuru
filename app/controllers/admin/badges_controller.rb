class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[ show edit update destroy ]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge), notice: t('.update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @badge.destroy

    redirect_to admin_badges_path, notice: t('.delete')
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :image_url, :condition, :condition_parameter, :single)
  end
end
