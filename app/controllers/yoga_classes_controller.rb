class YogaClassesController < ApplicationController
  before_action :authenticate_user!

  def index
    @yoga_classes = current_user.yoga_classes.future_classes
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
        render :new
      end 
  end

  def show 
    @yoga_class = current_user.yoga_classes.find_by(id: params[:id])
  end 

  def edit
    @yoga_class = current_user.yoga_classes.find_by(id: params[:id])
  end

  def update
    @yoga_class = current_user.yoga_classes.find_by(id: params[:id])
      if @yoga_class.update(yoga_class_params)
        redirect_to yoga_class_path(@yoga_class) 
      else 
        render :new
      end 
  end

  def delete
  end

  private

    def yoga_class_params
      params.require(:yoga_class).permit(:user_id, :name, :length, :date, :time, :difficulty, :studio_id, studio_attributes: [:name, :address, :phone_number])
    end 

end
