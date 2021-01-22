class Maint < ApplicationRecord
    validates :game, presence: true
    validates :content, presence: true
    validates :name, presence: true
end
