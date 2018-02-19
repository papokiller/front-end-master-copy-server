require 'open-uri'
class Part < ApplicationRecord
	has_many :uploader_files
  belongs_to :episode
  before_create :download_video

  def video_url
    if status > 0
      uploader = uploader_files.last
      uploader_data = uploader[:data]
      return "https://raw.githubusercontent.com/#{uploader.uploader.username}/#{uploader_data['repo']}/master#{video_url_local}"
    end
    super
  end

  private
  def download_video
  	File.open(Rails.root.join('public', uid), "w") do |f|
  	  IO.copy_stream(open(video_url), f)
  	end
  	self.video_url_local = "/#{uid}"
  end
end
