class MemorabiliasController < ApplicationController
    before_action :set_memorabilia, only: [:show, :edit, :update, :delete]
    before_action :authenticate_user!

    def index
        @memorabilias = current_user.memorabilias
    end

    def new
        @memorabilia = Memorabilia.new(athlete_id: params[:athlete_id])
    end

    def create
      if @memorabilia
        redirect_to memorabilia_path(@memorabilia)
      else
        render :new
      end
    end

    def show

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

    def set_memorabilia
        @memorabilia = Memorabilia.find_by(id: params[:id])
    end

    def memorabilia_params
        params.require(:memorabilia).permit(:user_id, :athlete_id, :price, :autographed, :item_type)
    end
end
