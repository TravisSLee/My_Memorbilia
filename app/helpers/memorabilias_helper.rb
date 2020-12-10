module MemorabiliasHelper
  def athlete_select(memorabilia)
    select_tag "memorabilia[athlete_id]", options_from_collection_for_select(Athlete.all.uniq(&:name), :id, :name)
  end
end
