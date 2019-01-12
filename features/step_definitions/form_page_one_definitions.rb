Given("the customer submits blank form") do
	$LIFE_INSURANCE_APP.form_page_one.click_see_quote_button
end

Then("directional content is displayed") do
	visible_result = $LIFE_INSURANCE_APP.form_page_one.info_text_visible?
	puts "Text Visible: #{visible_result}"
	# TODO: Take Screenshot Here
	expect(visible_result).to be true 
end

Then("required form fields are highlighted") do
	# TODO: Assert fields are highlighted in red
  # TODO: Take Screenshot Here
	puts "Required fields are highlighted RED: True"
end

Given("the customer selects date of birth out of range") do
  dob = "05/06/2003"
  puts "Entering DOB: #{dob}"
	$LIFE_INSURANCE_APP.form_page_one.set_date("05/06/2003")
end

Then("age guidelines content is presented") do
	res_alert = $LIFE_INSURANCE_APP.form_page_one.age_guidelines_visible?
  res_error = $LIFE_INSURANCE_APP.form_page_one.age_guidelines_error_description_visible?
	puts "Age Guidelines Alert Present?: #{res_alert}"
  puts "Age Guidelines Content Present?: #{res_error}"

	expect(res_alert).to be true
  expect(res_error).to be true
end

Then("customer is provided with contact phone number of {string}") do |string|
	text = $LIFE_INSURANCE_APP.form_page_one.error_secondary_description
  puts "Contact Explanation Text: #{text}"

  # TODO: Take Screenshot Here
  expect(text.include?(string)).to be true
end

Given("the customers enters minimal required information") do
  customer_info = {
      zip: '48312',
      height_ft: 6,
      height_in: 1,
      weight: 199,
      gender: 'Male',
      nicotine: :no,
      dob: '01/01/1980',
      health_rating: 'good',
      term_length: 10,
      aaa_member: :no
  }

	$LIFE_INSURANCE_APP.form_page_one.set_zip customer_info.dig(:zip)
	$LIFE_INSURANCE_APP.form_page_one.set_height customer_info.dig(:height_ft), customer_info.dig(:height_in)
	$LIFE_INSURANCE_APP.form_page_one.set_weight customer_info.dig(:weight)
	$LIFE_INSURANCE_APP.form_page_one.select_gender customer_info.dig(:gender)
	$LIFE_INSURANCE_APP.form_page_one.select_nicotine customer_info.dig(:nicotine)
	$LIFE_INSURANCE_APP.form_page_one.set_date customer_info.dig(:dob)
	$LIFE_INSURANCE_APP.form_page_one.select_rate_your_health customer_info.dig(:health_rating)
	$LIFE_INSURANCE_APP.form_page_one.select_term_length customer_info.dig(:term_length)
	$LIFE_INSURANCE_APP.form_page_one.select_aaa_member customer_info.dig(:aaa_member)

  puts "Entered Customer Info: #{customer_info}"
end

Given("the form is submitted") do
	$LIFE_INSURANCE_APP.form_page_one.click_see_quote_button
end

Then("the customer is taken to form page 2") do
	result = $LIFE_INSURANCE_APP.form_page_two.page_loaded?
  puts "Page two loaded: #{result}"
	expect(result).to be true
end