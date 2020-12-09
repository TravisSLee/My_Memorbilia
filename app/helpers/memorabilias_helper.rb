module MemorabiliasHelper
    def athlete_select(memorabilia)
        if memorabilia.athlete.nil?
          select_tag "memorabilia[athlete_id]", options_from_collection_for_select(Athlete.all, :id, :name)
        else
          hidden_field_tag "memorabilia[athlete_id]", memorabilia.athlete_id
        end
    end
end
