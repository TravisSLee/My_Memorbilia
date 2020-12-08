class Athlete < ApplicationRecord
    has_many :memorabilias
    has_many :users, through: :memorabilias

    validates :name, :team, presence: true
    validates :name, uniqueness: true
end
