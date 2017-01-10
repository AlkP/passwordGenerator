class Word < ApplicationRecord
  validates :title, presence:true
  validates :title, length: {minimum: 3, maximum: 40}
end
