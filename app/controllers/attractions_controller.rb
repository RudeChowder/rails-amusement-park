class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update]


  def index
    @attractions = Attraction.all
  end

  def show
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      flash[:success] = "#{@attraction.name} Created"
      redirect_to @attraction
    else
      render :new
    end
  end

  def edit; end

  def update
    @attraction.assign_attributes(attraction_params)
    if @attraction.save
      flash[:success] = "#{@attraction.name} Updated"
      redirect_to @attraction
    else
      render :edit
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(
      :name,
      :tickets,
      :nausea_rating,
      :happiness_rating,
      :min_height
    )
  end

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end
end
