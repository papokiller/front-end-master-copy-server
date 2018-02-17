class Api::V1::ApplicationController < ApplicationController
	def paginate(scope, includes: nil)
		current_page = (params[:per_page] || 10).to_i
	  collection = scope.page(params[:page]).per(current_page)
	  {
	  	data: collection.as_json(include: includes),
	  	meta: {
	  		total: collection.total_count,
	  		pages: collection.total_pages,
	  		current: current_page,
	  		per_page: current_page
	  	}
	  }
	end
end