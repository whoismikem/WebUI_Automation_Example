Given("the customer submits blank form") do
	App.form_page_one.click_see_quote_button
end

Then("directional content is displayed") do
	visible_result = App.form_page_one.info_text_visible?
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
	App.form_page_one.set_date("05/06/2003")
end

Then("age guidelines content is presented") do
	res_alert = App.form_page_one.age_guidelines_visible?
  res_error = App.form_page_one.age_guidelines_error_description_visible?
	puts "Age Guidelines Alert Present?: #{res_alert}"
  puts "Age Guidelines Content Present?: #{res_error}"

	expect(res_alert).to be true
  expect(res_error).to be true
end

Then("customer is provided with contact phone number of {string}") do |string|
	text = App.form_page_one.error_secondary_description
  puts "Contact Explanation Text: #{text}"

  # TODO: Take Screenshot Here
  expect(text.include?(string)).to be true
end

Given("the form is submitted") do
	App.form_page_one.click_see_quote_button
end

Then("the customer is taken to form page 2") do
	result = App.form_page_two.page_loaded?
  puts "Page two loaded: #{result}"
	expect(result).to be true
end

Given("the customers enters minimal required information {string} {int} {int} {int} {string} {string} {string} {string} {int} {string} {string}") do |zip, height_ft, height_in, weight, gender, nicotine, dob, health_rating, term_length, member, email|
	input_data = { zip: zip,
                 height_ft: height_ft,
                 height_in: height_in,
                 weight: weight,
                 gender: gender,
                 nicotine: nicotine,
                 dob: dob,
                 health_rating: health_rating,
                 term_lenght: term_length,
                 member: member,
                 email: email
  							}

	App.form_page_one.fill_form(input_data)
end
