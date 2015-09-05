require 'remote/string'

class RequireUtil
	def self.require_all_files_on(a_path, show_files = false)
		Dir[File.join(File.dirname(__FILE__),append_ruby_extension(a_path))].sort.each do |a_file_path| 
			require a_file_path
			show_file a_file_path, show_files
		end
	end

	private
	def self.show_file(a_file_path,show)
		if show
			puts "\"#{a_file_path.sub_after_last('/')}\" loaded..."
		end
	end

	def self.append_ruby_extension(a_file_path)
		if not a_file_path.end_with? ruby_extension 
			a_file_path + ruby_extension
		end
	end

	def self.ruby_extension
		".rb"
	end

	private_class_method :new
end