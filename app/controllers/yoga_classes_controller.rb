class YogaClassesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_yoga_class, only: [:show, :edit, :update, :destroy]

  def index
    if params[:past_classes]
      @past_yoga_classes = current_user.yoga_classes.past_classes
      @past_yoga_classes = @past_yoga_classes.order(date: :asc)
    end 
    @yoga_classes = current_user.yoga_classes.future_classes
    @yoga_classes = @yoga_classes.order(date: :asc)
  end

  def new
    @yoga_class = current_user.yoga_classes.build
     
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
    if @yoga_class.nil?
      redirect_to yoga_classes_path, alert: "Yoga class not found."
    end 
  end 

  def edit
    if @yoga_class.nil?
      redirect_to yoga_classes_path, alert: "Yoga class not found."
    end 
  end

  def update
      if @yoga_class.update(yoga_class_params)
        redirect_to yoga_class_path(@yoga_class) 
      else 
        render :new
      end 
  end

  def destroy
    @yoga_class.destroy 
    flash[:notice] = "Yoga class deleted."
    redirect_to yoga_classes_path
  end

  private

    def set_yoga_class
      @yoga_class = current_user.yoga_classes.find_by(id: params[:id])
    end 

    def yoga_class_params
      # raise params.inspect 
      params.require(:yoga_class).permit(:user_id, :name, :length, :date, :time, :difficulty, :past_classes, :studio_id, studio_attributes: [:name, :address, :phone_number])
    end 

end
