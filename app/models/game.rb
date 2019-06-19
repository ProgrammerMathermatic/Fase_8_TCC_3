class Game < ApplicationRecord
    belongs_to :user
    validates_presence_of :name, :system, :status, :user_id
end
