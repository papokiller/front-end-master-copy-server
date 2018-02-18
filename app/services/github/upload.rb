class Github::Upload
	attr_accessor :part

	PUBLIC_FOLDER = Rails.public_path.to_s

	def initialize(part:)
		@part = part
	end

	def proccess!
		@part = part
		repo_name = SecureRandom.hex
		Github::Client::Create.new(
			access_token: uploader.access_token
		).create(name: repo_name)
		folder = make_folder!
		folder_git = copy_file!(folder)
		create_repo_and_push!(folder, repo_name)
		delete_folder!(folder)
		part.update status: 1
	end

	private

	def uploader
		@uploader ||= Uploader.last
	end

	def make_folder!
		folder_name = "#{PUBLIC_FOLDER}/git-copy-#{SecureRandom.uuid}"
		Dir.mkdir(folder_name)
		%x(cd #{folder_name} && git init)
		folder_name
	end

	def copy_file!(folder)
		file_to_copy = "#{PUBLIC_FOLDER}#{@part.video_url_local}"
		file_dest = "#{folder}#{@part.video_url_local}"
		FileUtils.cp(file_to_copy, file_dest)
		file_dest
	end

	def create_repo_and_push!(folder, repo_name)
		git_client = Git.open(folder, :log => Logger.new(STDOUT))
		git_client.add all: true
		git_client.commit("#{SecureRandom.hex} FUCK YOU #{SecureRandom.hex}")
		git_client.add_remote("hola", "https://#{uploader.username}:#{uploader.password}@github.com/#{uploader.username}/#{repo_name}.git")
		git_client.push(git_client.remote("hola"))
		uploader.uploader_files.create!(data: {repo: repo_name}, part_id: @part.id)
	end

	def delete_folder!(folder)
		FileUtils.rm_rf(folder)
	end
end