class Error < ApplicationRecord
    validates :game, presence: true
    validates :problem, presence: true
    validates :approach, presence: true
    validates :name, presence: true
end
