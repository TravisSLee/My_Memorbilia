class MemorabiliasController < ApplicationController
    before_action :set_memorabilia, only: [:show, :edit, :update]
    before_action :require_login

    def index
        @memorabilias = Memorabilia.all
    end

    def new

    end

    def create

    end

    def show

    end

    def edit

    end

    def update

    end

    private

    def set_memorabilia
        @memorabilia = Memorabilia.find_by(id: params[:id])
    end

    def memorabilia_params
        params.require(:memorabilia).permit(:user_id, :athlete_id, :price, :autographed, :item_type)
    end
end
