require_relative 'utility_page'

class FormPageOne
	include UtilityPage

	# Page Content
	PAGE_TITLE = 'Get a Traditional Term Quote'
	ERROR_DESCRIPTION = 'Based on the information you’ve provided, you do not meet our age guidelines for this product.'

	# IDENTIFIERS
	PAGE_TITLE_ID = { id: 'formCmpnt-heading productName-large' }
	SEE_YOUR_QUOTE_BUTTON_ID = { id: 'seeQuote'}
	INFO_TEXT_ID = { css: 'html body div div div.formCmpnt.combinedForm-quoteForm.bg-responsive div.row.formCmpnt-content.small-collapse.large-uncollapse div.small-12.large-8.large-offset-3.columns.formCmpnt-form.qfWide div.row.collapse.show-for-large div.large-9.large-offset-2.columns p.inlineValidation.inlineValidation-quote.show'}

	ZIP_CODE_ID = { id: 'zip' }
	HEIGHT_FEET_ID = { id: 'feet' }
	HEIGHT_INCHES_ID = { id: 'inches' }
	WEIGHT_ID = { id: 'weight' }
	DOB_MONTH_ID = { id: 'month' }
	DOB_DAY_ID  = { id: 'day' }
	DOB_YEAR_ID  = { id: 'year' }
	GENDER_ID = { id: 'gender' }
	NICOTINE_YES_ID = { id: 'nicotineUseYes' }
	NICOTINE_NO_ID = { id: 'nicotineUseNo' }
	COVERAGE_AMOUNT_ID = { id: 'coverageAmount' }
	TERM_LENGTH_ID = { id: 'termLength' }
	MEMBER_YES_ID = {id: 'isMemberYes' }
	MEMBER_NO_ID = {id: 'isMemberNO' }
	EMAIL_ID = { id: 'contact_email' }
	RATE_YOUR_HEALTH_ID = { id: 'rateYourHealth' }


	AGE_GUIDELINES_ALERT_ID = { :class => 'error-modal '}
	ERROR_DESCRIPTION_ID = { :class => 'error-desc' }
	ERROR_SECONDARY_DESCRIPTION_ID = { :class => 'error-secondarydesc'}

	# BOOLS
	def page_loaded?
		title = find_element PAGE_TITLE_ID
		title == PAGE_TITLE ? true : false
	end

	def info_text_visible?
		find_element(INFO_TEXT_ID).displayed?
	rescue
		return false
	end

	def age_guidelines_visible?
		wait_for_element_visible(AGE_GUIDELINES_ALERT_ID)
	rescue
		false
	end

	def age_guidelines_error_description_visible?
		find_element(ERROR_DESCRIPTION_ID).text == ERROR_DESCRIPTION
	end

	# CLICK
	def click_see_quote_button
		find_element(SEE_YOUR_QUOTE_BUTTON_ID).click
	end

	# SELECT
	def select_dob_month(month)
		find_element(DOB_MONTH_ID).find_element(:css,"option[value='#{month}']").click
	end

	def select_dob_day(day)
		find_element(DOB_DAY_ID).find_element(:css,"option[value='#{day}']").click
	end

	def select_dob_year(year)
		find_element(DOB_YEAR_ID).find_element(:css,"option[value='#{year}']").click
	end

	def select_height_feet(feet)
		find_element(HEIGHT_FEET_ID).find_element(:css,"option[value='#{feet}']").click
	end

	def select_height_inches(inches)
		find_element(HEIGHT_INCHES_ID).find_element(:css,"option[value='#{inches}']").click
	end

	def select_gender(gender)
		option = find_element(GENDER_ID).find_elements(:tag_name,"option").detect { |option| option.attribute('text').eql? "#{gender}"}
		option.click
	end

	def select_term_length(term)
    find_element(TERM_LENGTH_ID).find_element(:css,"option[value='#{term}']").click
  end

  def select_member(select)
    case select
		when 'Yes', 'yes', :yes
      find_element(MEMBER_YES_ID).click
    when 'No', 'no', :no
      find_element(MEMBER_NO_ID).click
    end
	end

	def select_nicotine(select)
		case select
		when 'Yes', 'yes', :yes
			find_element(NICOTINE_YES_ID).click
		when 'No', 'no', :no
			find_element(NICOTINE_NO_ID).click
		end
	end

	def select_rate_your_health(select)
		find_element(RATE_YOUR_HEALTH_ID).find_element(:css,"option[value='#{select}']").click if wait_for_element_visible(RATE_YOUR_HEALTH_ID)
	end
	#---

	def error_description
		find_element(ERROR_DESCRIPTION_ID).text
	end

	def error_secondary_description
		find_element(ERROR_SECONDARY_DESCRIPTION_ID).text
	end

	# SETTERS
	def set_date(date)
		date = Date.parse date

		select_dob_month date.month
		select_dob_day date.day
		select_dob_year date.year
	end

	def set_zip(zip)
		find_element(ZIP_CODE_ID).send_keys(zip)
	end

	def set_height(feet: nil, inches: nil)
		select_height_feet feet unless feet.nil?
		select_height_inches inches unless inches.nil?
	end

	def set_weight(lbs)
		find_element(WEIGHT_ID).send_keys(lbs)
	end

	#---

	def fill_form(input_data)
		input_data.each do |element|
			case element.first
			when :zip
				set_zip element[1]
			when :height_ft
				select_height_feet element[1]
			when :height_in
				select_height_inches element[1]
			when :weight
				set_weight element[1]
			when :gender
				select_gender element[1]
			when :nicotine
				select_nicotine element[1]
			when :dob
				set_date element[1]
			when :health_rating
				select_rate_your_health element[1]
			when :term_lenght
				select_term_length element[1]
			when :member
					select_member element[1]
			when :email
				# TODO: Add email
			end
		end
	end
end