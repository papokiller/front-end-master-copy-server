class Github::Client::Create < Github::Client::Service
	def create(data)
		RestClient.post(endpoints.create, data.to_json, headers_auth)
	end
end