class YogaClassesController < ApplicationController
  before_action :authenticate_user!
  # before_action :authorize_teacher, only: [:edit, :update]

  def index
    @yoga_classes = YogaClass.all 
  end

  def new
    @yoga_class = YogaClass.new 
  end

  def create
    @yoga_class = YogaClass.create(yoga_class_params)
    redirect_to yoga_class_path(@yoga_class)
  end

  def show 
    @yoga_class = YogaClass.find_by(id: params[:id])
  end 

  def edit
  end

  def update
  end

  def delete
  end

  private

    def yoga_class_params
      params.require(:yoga_class).permit(:name, :length, :date, :time, :difficulty, :studio_name, :teacher_name)
    end 

end
