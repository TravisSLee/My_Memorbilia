class MemorabiliasController < ApplicationController
    before_action :set_athlete, except: [:new, :index]
    before_action :set_memorabilia, only: [:edit, :update, :destroy]
    before_action :authenticate_user!

    def index
      if params[:athlete_id]
        set_athlete
          if @athlete.nil?
            redirect_to root_path, alert: "Athlete not found"
          else
            @memorabilias = @athlete.memorabilias
          end
      elsif params[:expensive]
        @memorabilias =  current_user.memorabilias.expensive
      else
        @memorabilias = current_user.memorabilias
      end
    end

    def new
      if params[:athlete_id]
        set_athlete
        @memorabilia = @athlete.memorabilias.build
      else  
        @memorabilia = current_user.memorabilias.build
        @athlete = @memorabilia.build_athlete
      end
    end

    def create
      @memorabilia = current_user.memorabilias.build(memorabilia_params)
      binding.pry
      if @memorabilia.save
        redirect_to athlete_memorabilia_path(@memorabilia.athlete, @memorabilia)
      else
        render :new
      end
    end

    def show
      if params[:athlete_id]
        set_athlete
          if @athlete.nil?
            redirect_to root_path, alert: "Athlete not found"
          else
            @memorabilia = @athlete.memorabilias.find_by(id: params[:id])
          end
      else
         set_memorabilia
       end
    end

    def edit
      if params[:athlete_id]
        set_athlete
          if @athlete.nil?
            redirect_to root_path, alert: "Athlete not found"
          else
            @memorabilia = @athlete.memorabilias.find_by(id: params[:id])
          end
      else
          set_memorabilia
       end
    end

    def update
        @memorabilia.update(memorabilia_params)
        if @memorabilia.save
          redirect_to athlete_memorabilia_path(@memorabilia.athlete, @memorabilia)
        else
          render :edit
        end
    end

    def destroy
        set_athlete
        @memorabilia = @athlete.memorabilias.find_by(id: params[:id])
        @memorabilia.destroy
        redirect_to athlete_memorabilias_path(@athlete)
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
