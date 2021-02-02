class Athlete < ApplicationRecord
    has_many :memorabilias
    has_many :users, through: :memorabilias

    validates :name, :team, presence: true

    def self.search(query)
        if query
            self.where('name LIKE ?', "%#{query}%")
        else
            self.all
        end
    end
end
