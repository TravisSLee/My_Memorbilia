class Athlete < ApplicationRecord
    has_many :memorabilias
    has_many :users, through: :memorabilias

    vadilates :name, :team, presence: true
    vadilates :name, presence: uniqness
end
