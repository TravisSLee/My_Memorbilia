class AthletesController < ApplicationController
    before_action :set_athlete, only: [:show, :create]
    before_action :authenticate_user!
    
    def index
        @athletes = current_user.athletes
    end
    
    def new
        @athlete = current_user.athletes.build
    end

    def create
        @athlete = current_user.athletes.build(athlete_params)
        if @athlete.save
            redirect_to @athlete
        else
            render :new
        end
    end

    def show
        @memorabilia = @athlete.memorabilias.build
    end

    private 

    def set_athlete
        @athlete = Athlete.find_by(id: params[:id])
    end

    def athlete_params
        params.require(:athlete).permit(:name, :team, :active)
    end
end
