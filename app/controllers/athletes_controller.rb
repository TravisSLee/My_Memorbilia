class AthletesController < ApplicationController
    before_action :set_athlete, only: [:show, :create, :edit, :update, :delete]
    before_action :authenticate_user!
    
    def index
        @athletes = current_user.athletes
    end

    def show

    end

    private 

    def set_athlete
        @athlete = Athlete.find_by(id: params[:id])
    end
end
