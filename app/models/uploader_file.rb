class UploaderFile < ApplicationRecord
  belongs_to :part
  belongs_to :uploader
end
