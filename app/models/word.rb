class Word < ApplicationRecord
  validates :title, presence:true
  validates :title, length: {minimum: 3, maximum: 40}
  
  scope :arr_pass, -> { all.collect{ |p| p.title }.permutation(2).collect{ |p| p[0] + p[1] }.to_a }

end
