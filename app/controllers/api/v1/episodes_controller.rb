class Api::V1::EpisodesController < Api::V1::ApplicationController
	before_action :set_course
	
	def index
		render json: paginate(@course.episodes, includes: [:parts])
	end

	def create
		@episode = @course.episodes.new(episode_params)
		if @episode.save
			render json: @episode, status: 202
		else
			render json: @episode.errors.details.messages, status: 400
		end
	end

	private
	def episode_params
		params.permit(:name, :uid)
	end
	def set_course
		@course = Course.find(params[:course_id])
	end
end