class Champ < ApplicationRecord
    validates :name, :age, :ability, :image, presence: true
    validates :ability, length: { minimum: 10 }
end
