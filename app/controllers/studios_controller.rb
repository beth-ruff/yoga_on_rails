class StudiosController < ApplicationController

    def index
      @studios = current_user.studios.uniq
    end
    
    def show 
       @studio = current_user.studios.find_by(id: params[:id])
        if @studio.nil?
          redirect_to studios_path, alert: "Studio not found."
        end 
    end 

end