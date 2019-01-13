require_relative 'utility_page'

class FormPageTwo
	include UtilityPage

	# Page Content
	PAGE_TITLE = 'Your Traditional Term Life Insurance Quote'

	# IDENTIFIERS
	PAGE_TITLE_ID = { css: '.large-10 > h3:nth-child(1)' }



	def page_loaded?
		title_element = wait_for PAGE_TITLE_ID
		(title_element.text == PAGE_TITLE && title_element.displayed?) ? true : false
	end
end