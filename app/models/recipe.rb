class Recipe < ApplicationRecord
    belongs_to: User
    has_many :recipe_foods, dependent: :destroy

    validates :name, presence: true
    validates :description, presence: true
    validates :preparation_time, presence: true
    validates :cooking_time, presence: true
    validates :public, presence: true

end
