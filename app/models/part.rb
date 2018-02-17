require 'open-uri'
class Part < ApplicationRecord

  belongs_to :episode

  before_save :download_video

  private
  def download_video
  	File.open(Rails.root.join('public', uid), "w") do |f|
  	  IO.copy_stream(open(video_url), f)
  	end
  	self.video_url_local = "/#{uid}"
  end
end
