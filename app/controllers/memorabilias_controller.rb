class MemorabiliasController < ApplicationController
    
    
    def index

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

    def memorabilia_params
        params.require(:memorabilia).permit(:user_id, :athlete_id, :price, :autographed, :item_type)
    end
end
