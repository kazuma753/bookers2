class Book < ApplicationRecord

	validates :title,presence: true
    validates :body,presence: true,
               length: { maximum: 200 }

    validates :title,
                  length: { maximum: 50 }
    
  belongs_to :user
end
