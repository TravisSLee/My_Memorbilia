class MemorabiliasController < ApplicationController
    before_action :set_athlete, except: [:new,:create, :show, :index]
    before_action :set_memorabilia, only: [:edit, :update, :delete]
    before_action :authenticate_user!

    def index
      if params[:athlete_id]
        athlete = current_user.athletes.find_by(id: params[:athlete_id])
          if athlete.nil?
            redirect_to root_path
          else
            @memorabilias = athlete.memorabilias
          end 
      else
        @memorabilias = current_user.memorabilias
      end
    end

    def new
      @memorabilia = current_user.memorabilias.build
      @athlete = @memorabilia.build_athlete
    end

    def create
      @memorabilia = current_user.memorabilias.build(memorabilia_params)
      @athlete = Athletes.find_or_create_by(id: params[:athlete_id])
      if @memorabilia.save
        redirect_to athlete_memorabilia_path(@athlete)
      else
        render :new
      end
    end

    def show
      if params[:athlete_id]
        @athlete = current_user.athletes.find_by(id: params[:athlete_id])
          if @athlete.nil?
            redirect_to root_path, alert: "Athlete not found"
          else
            @memorabilias = @athlete.memorabilias
          end
      else
          redirect_to memorabilias_path
       end
    end

    def edit
        
    end

    def update
        @memorabilia.update(memorabilia_params)
        if @memorabilia.save
          redirect_to memorabilia_path(@memorabilia)
        else
          render :edit
        end
    end

    def delete
        @memorabilia.destroy
        flash[:notice] = "You have deleted this item."
        redirect_to memorabilias_path
    end

    private


    def set_athlete
      @athlete = current_user.athletes.find_by(id: params[:athlete_id])
    end

    def set_memorabilia
      @memorabilia = current_user.memorabilias.find_by(id: params[:id])
    end

    def memorabilia_params
        params.require(:memorabilia).permit(:user_id, :athlete_id, :price, :autographed, :item_type, athlete_attributes: [
          :name,
          :team,
          :active
       ])
    end
end
