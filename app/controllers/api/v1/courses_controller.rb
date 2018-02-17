class Api::V1::CoursesController < Api::V1::ApplicationController
	def index
		@courses = Course.all 
		render json: paginate(@courses)
	end

	def create
		@course = Course.new(course_params)
		if @course.save
			render json: @course, status: 202
		else
			render json: @course.errors.details.messages, status: 400
		end
	end

	def course_params
		params.permit(:name ,:summary ,:name_instructor ,:bio_instructor ,:time_course ,:link, :uid)
	end
end