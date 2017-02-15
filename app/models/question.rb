class Question < ApplicationRecord
  has_many :answers
  belongs_to :user

  validates :query, :presence => true

end
