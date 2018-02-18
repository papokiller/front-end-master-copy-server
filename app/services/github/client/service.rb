class Github::Client::Service
	attr_accessor :access_token
	def initialize(access_token: nil)
		@access_token = access_token
		#f06f55431b4914d9c37e18279fbbd5e8bfa5f1c9
	end

	private
	
	def endpoints
		OpenStruct.new(
			create: 'https://api.github.com/user/repos'
		)
	end

	def headers_auth
		{
			'Authorization': "token #{access_token}",
			'content-type': 'application/json'
		}
	end
end