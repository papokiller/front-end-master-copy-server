class Course < ApplicationRecord
	has_many :episodes, dependent: :destroy
end
