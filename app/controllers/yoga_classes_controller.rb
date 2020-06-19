class YogaClassesController < ApplicationController
  before_action :authenticate_user!

  def index
    @yoga_classes = current_user.yoga_classes
    @yoga_classes = @yoga_classes.order(date: :asc)
  end

  def new
    @yoga_class = current_user.yoga_classes.build
    @studio = @yoga_class.build_studio 
  end

  def create
    @yoga_class = current_user.yoga_classes.new(yoga_class_params)
      if @yoga_class.valid?
        @yoga_class.save
        redirect_to yoga_class_path(@yoga_class) 
      else 
        redirect_to new_yoga_class_path
      end 
  end

  def show 
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
