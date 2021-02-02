class Memorabilia < ApplicationRecord
    belongs_to :user
    belongs_to :athlete
    accepts_nested_attributes_for :athlete, reject_if: proc {|attributes| attributes['name'].blank?}
    validates :item_type, :price, presence: true

    scope :expensive, -> { where("price > 100") }
    scope :cheap, -> { order(price: :desc) } 
    scope :cheapest, -> { cheap.first }

    def self.search(query)
        if query
            self.where('item_type LIKE ?', "%#{query}%")
        else
            self.all
        end
    end
end