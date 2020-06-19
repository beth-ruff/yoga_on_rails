class StudentsController < ApplicationController
    
      def new
        @yoga_class = YogaClass.find(params[:yoga_class_id])
        @student = @yoga_class.students.build
      end
    
      def create
        # binding.pry 
        @yoga_class = YogaClass.find(params[:yoga_class_id])
        @student = @yoga_class.students.new(student_params)
        if @student.save
            redirect_to yoga_class_path(@yoga_class)
        else 
            redirect_to new_yoga_class_student_path(@yoga_class)
        end 
      end
    

      private

        def student_params
            params.require(:student).permit(:name)
        end 

end