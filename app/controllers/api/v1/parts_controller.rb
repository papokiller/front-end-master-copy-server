class Api::V1::PartsController < Api::V1::ApplicationController
	before_action :set_episode
	
	def index
		render json: paginate(@course.episodes, includes: [:parts])
	end

	def create
		@part = @episode.parts.new(part_params)
		if @part.save
			render json: @part, status: 202
		else
			render json: @part.errors.details.messages, status: 400
		end
	end

	private
	
	def part_params
		params.permit(:name, :description, :time, :link, :image, :download_local, :video_url, :uid)
	end

	def set_episode
		@episode = Course.find(params[:course_id]).episodes.find(params[:episode_id])
	end
end

