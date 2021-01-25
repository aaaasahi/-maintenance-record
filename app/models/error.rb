class Error < ApplicationRecord
    validates :game, presence: true
    validates :problem, presence: true
    validates :approach, presence: true
    validates :name, presence: true

    def display_created_at
        I18n.l(self.created_at, format: :default)
    end
end
