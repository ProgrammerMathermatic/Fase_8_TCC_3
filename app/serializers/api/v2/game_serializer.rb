class Api::V2::GameSerializer < ActiveModel::Serializer
    attributes :id, :name, :system, :status, :rating, :date, :comment, :user_id, :created_at, :updated_at
    
    def is_late
        Date.current > object.date if object.date.present?
    end
    
    belongs_to :user
end
