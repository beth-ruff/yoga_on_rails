class StudentsController < ApplicationController
    
    def index 
        @students = YogaClass.find(params[:yoga_class_id]).students
    end   
  
    def new 
      if params[:yoga_class_id] && !YogaClass.exists?(params[:yoga_class_id])
        redirect_to yoga_classes_path, alert: "Yoga class not found."
      else 
        @student = Student.new(yoga_class_id: params[:yoga_class_id]) 
      end 
    end
    
    def create
      @student = Student.new(student_params)
        if @student.valid?
          @student.save
          redirect_to @student
        else 
          render :new
        end 
    end

    def show 
      
      if params[:yoga_class_id]
        @yoga_class = YogaClass.find_by(id: params[:yoga_class_id])
        @student = @yoga_class.students.find_by(id: params[:id])
        if @student.nil?
          redirect_to yoga_class_students_path(@yoga_class), alert: "Student not found."
        end 
      else 
        @student = Student.find_by(id: params[:id])
      end 
    end 
    
    def edit 
      if params[:yoga_class_id]
      @yoga_class = YogaClass.find_by(id: params[:yoga_class_id])
        if @yoga_class.nil?
          redirect_to yoga_classes_path, alert: "Yoga Class not found."
        else 
          @student = @yoga_class.students.find_by(id: params[:id])
          redirect_to yoga_class_students_path(@yoga_class), alert: "Student not found." if @student.nil?
        end 
      else 
        @student = Student.find_by(id: params[:id])
      end 
    end 

    def update
      @student = Student.find_by(id: params[:id])
      if @student.update(student_params)
        redirect_to @student 
      else 
        render :edit
      end 
    end 

    def destroy
      @student = Student.find_by(id: params[:id])
      @student.destroy 
      flash[:notice] = "Student deleted."
      redirect_to yoga_class_path(@student.yoga_class)
    end


      private

        def student_params
            params.require(:student).permit(:name, :yoga_class_id)
        end 

end