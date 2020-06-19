class StudiosController < ApplicationController

    def index
      @studios = current_user.studios
    end
    
    def show 
       @studio = current_user.studios.find_by(id: params[:id])
    end 

end