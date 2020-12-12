class Memorabilia < ApplicationRecord
    belongs_to :user
    belongs_to :athlete
    # accepts_nested_attributes_for :athlete, reject_if: :all_blank
    validates :item_type, :price, presence: true


    scope :expensive, -> { where("price > 100") }
end