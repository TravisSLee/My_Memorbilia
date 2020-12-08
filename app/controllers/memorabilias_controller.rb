class MemorabiliasController < ApplicationController
    before_action :set_athlete, except: [:new, :index]
    before_action :set_memorabilia, only: [:show, :edit, :update, :delete]
    before_action :authenticate_user!

    def index
      if params[:athlete_id]
        @athlete = Athlete.find_by(id: params[:athlete_id])
          if @athlete.nil?
            redirect_to root_path
          else
            @memorabilias = current_user.memorabilias
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
      @memorabilia = current_user.memorabilias.create(memorabilia_params)
      if @memorabilia.save
        redirect_to athlete_memorabilia_path
      else
        render :new
      end
    end

    def show
      athlete = Athlete.find_by(id: params[:athlete_id])
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
      @athtele = current_user.athletes.find_by(id: params[:athlete_id])
    end

    def set_memorabilia
      @memorabilia = @athlete.memorabilias.find_by(id: params[:id])
    end

    def memorabilia_params
        params.require(:memorabilia).permit(:user_id, :athlete_id, :price, :autographed, :item_type, athlete_attributes: [
          :name,
          :team,
          :active
       ])
    end
end
