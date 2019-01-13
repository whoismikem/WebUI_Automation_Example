Feature: Online Life Insurance Quote Request App
  As stakeholders
  We want to provide an ability for our customers to request a life insurance quote online

  @blank_form_handling
  Scenario: Submit blank form error handling
    Given the customer submits blank form
    Then directional content is displayed
    And required form fields are highlighted

  @age_guidelines
  Scenario: Age guidelines content presented
    Given the customer selects date of birth out of range
    Then age guidelines content is presented
    And customer is provided with contact phone number of "(888) 422-7020"

  @minimal_info
  Scenario Outline: Submit minimal required form information
    Given the customers enters minimal required information <zip> <height_ft> <height_in> <weight> <gender> <nicotine> <dob> <health_rating> <term_length> <member> <email>
    And the form is submitted
    Then the customer is taken to form page 2

    Examples:
      | zip     | height_ft | height_in | weight |  gender    | nicotine | dob          | health_rating | term_length | member | email |
      | '48081' | 6         | 8         | 199    |  'Male'    | 'no'     | '01/01/1980' | 'good'        | 10          | 'no'   |   ''  |
      | '48313' | 5         | 7         | 120    |  'Female'  | 'yes'    | '05/03/1989' | 'good'        | 10          | 'no'   |   ''  |
