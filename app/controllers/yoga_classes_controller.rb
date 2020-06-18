class YogaClassesController < ApplicationController
  before_action :authenticate_user!

  def index
    @yoga_classes = current_user.yoga_classes 
  end

  def new
    @yoga_class = current_user.yoga_classes.build
    @studio = @yoga_class.build_studio 
  end

  def create
    @yoga_class = current_user.yoga_classes.create(yoga_class_params)
    redirect_to yoga_class_path(@yoga_class) 
  end

  def show 
    # binding.pry 
    @yoga_class = current_user.yoga_classes.find_by(id: params[:id])
  end 

  def edit
  end

  def update
  end

  def delete
  end

  private

    def yoga_class_params
      params.require(:yoga_class).permit(:user_id, :name, :length, :date, :time, :difficulty, :studio_id, studio_attributes: [:name, :address, :phone_number])
    end 

end
