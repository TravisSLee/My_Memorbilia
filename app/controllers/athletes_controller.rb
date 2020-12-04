class AthletesController < ApplicationController
    def index
        @athletes = current_user.athletes
    end
end
