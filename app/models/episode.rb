class Episode < ApplicationRecord
  belongs_to :course
  has_many :parts
end
