class Maint < ApplicationRecord
    validates :game, presence: true
    validates :content, presence: true
    validates :name, presence: true

    def display_created_at
        I18n.l(self.created_at, format: :default)
    end
end
