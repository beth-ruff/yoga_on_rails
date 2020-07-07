class StudentsController < ApplicationController
  before_action :set_yoga_class
  before_action :set_student, only: [:update, :destroy]
    
    def index  
      @students = @yoga_class.students.find_by(id: params[:yoga_class_id])
    end   
  
    def new 
      if params[:yoga_class_id] && !YogaClass.exists?(params[:yoga_class_id])
        redirect_to yoga_classes_path, alert: "Yoga class not found."
      else 
         @student = @yoga_class.students.build(yoga_class_id: params[:yoga_class_id])
      end 
    end
    
    def create
      @student = @yoga_class.students.new(student_params)
        if @student.valid?
          @student.save
          redirect_to yoga_class_student_path(@yoga_class, @student)
        else 
          render :new
        end 
    end

    def show 
      if @yoga_class.nil?
        redirect_to yoga_classes_path, alert: "Yoga class not found."
      else set_student 
        if 
          @student.nil?
          redirect_to yoga_class_path(@yoga_class), alert: "Student not found."
        end 
      end 
    end 
    
    def edit 
      if @yoga_class.nil?
        redirect_to yoga_classes_path, alert: "Yoga class not found."
      else set_student 
        if @student.nil?
        redirect_to yoga_class_path(@yoga_class), alert: "Student not found."
        end 
      end 
    end 

    def update
      if @student.update(student_params)
        redirect_to yoga_class_student_path(@yoga_class, @student)
      else 
        render :edit
      end 
    end 

    def destroy
      @student.destroy 
      flash[:notice] = "Student deleted."
      redirect_to yoga_class_path(@student.yoga_class)
    end


      private

        def set_yoga_class
          @yoga_class = YogaClass.find_by(id: params[:yoga_class_id])
        end 

        def set_student
          @student = @yoga_class.students.find_by(id: params[:id])
        end 

        def student_params
            params.require(:student).permit(:name, :yoga_class_id)
        end 

end