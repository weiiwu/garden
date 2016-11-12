class PlantsController < ApplicationController
  before_action :find_plant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    if params[:category].blank?
      @plants = Plant.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @plants = Plant.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def show
    if @plant.reviews.blank?
      @average_review = 0
    else
      @average_review = @plant.reviews.average(:rating).round(2)
    end
  end

  def new
    @plant = current_user.plants.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @plant = current_user.plants.build(plant_params)
    @plant.category_id = params[:category_id]

    if @plant.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def update
    @plant.category_id = params[:category_id]
    if @plant.update(plant_params)
      redirect_to plant_path(@plant)
    else
      render 'edit'
    end
  end

  def destroy
    @plant.destroy
    redirect_to root_path
  end

  private

    def plant_params
      params.require(:plant).permit(:name, :description, :owner, :category_id, :plant_img)
    end

    def find_plant
      @plant = Plant.find(params[:id])
    end

end
