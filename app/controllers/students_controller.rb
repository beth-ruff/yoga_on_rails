class StudentsController < ApplicationController
    
      def new
        @yoga_class = YogaClass.find(params[:yoga_class_id])
        @student = @yoga_class.students.build
      end
    
      def create
        @yoga_class = YogaClass.find(params[:yoga_class_id])
        @student = @yoga_class.students.new(student_params)
        if @student.valid?
          @student.save
          redirect_to yoga_class_path(@yoga_class)
        else 
            render :new
        end 
      end
    

      private

        def student_params
            params.require(:student).permit(:name)
        end 

end