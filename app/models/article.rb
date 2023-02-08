class Article < ApplicationRecord
    validates_presence_of :title, presence: true
    validates_presence_of :content, presence: true
    validates_presence_of :slug, presence: true, uniqueness: true

    scope :recent, -> { order(created_at: :desc) } 
end
