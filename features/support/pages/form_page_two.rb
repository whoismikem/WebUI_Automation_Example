require_relative 'utility_page'

class FormPageTwo
	include UtilityPage

	# Page Content
	PAGE_TITLE = 'Your Traditional Term Life Insurance Quote'

	# IDs
	PAGE_TITLE_ID = { css: '.large-10 > h3:nth-child(1)' }


	# Bools
	def page_loaded?
		title_element = wait_for PAGE_TITLE_ID

		if title_element.text == PAGE_TITLE && title_element.displayed?
			true
		else
			false
		end
	end



end