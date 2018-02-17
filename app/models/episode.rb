class Episode < ApplicationRecord
  belongs_to :course
  has_many :parts, dependent: :destroy
end
