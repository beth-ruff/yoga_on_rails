class YogaClass < ApplicationRecord
    belongs_to :studio
    belongs_to :user
    belongs_to :teacher

    def studio_name=(name)
        self.studio = Studio.find_or_create_by(name: name)
    end 

    def studio_name 
        self.studio ? self.studio.name : nil 
    end 

    def teacher_name=(name)
        self.teacher = Teacher.find_or_create_by(name: name)
    end 

    def teacher_name 
        self.teacher ? self.teacher.name : nil 
    end 

end
