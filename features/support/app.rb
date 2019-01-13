
class App

	def self.form_page_one
		form_page_one ||= FormPageOne.new
	end

	def self.form_page_two
		form_page_two ||= FormPageTwo.new
	end
end