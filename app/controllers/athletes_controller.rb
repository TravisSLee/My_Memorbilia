class AthletesController < ApplicationController
    before_action :set_athlete, only: [:show]
    before_action :authenticate_user!
    
    def index
        @athletes = current_user.athletes.search(params[:query]).uniq(&:name)
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
        if @athlete.nil?
            redirect_to athletes_path, alert: "Athlete not found!"
        else
            @memorabilias = @athlete.memorabilias
        end
    end

    private 

    def set_athlete
        @athlete = current_user.athletes.find_by(id: params[:id])
    end

    def athlete_params
        params.require(:athlete).permit(:name, :team, :active)
    end
end
