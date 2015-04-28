Given(/^I am on the registration page$/) do
  #1 - initialize variables
  registration = settings.urlHttps+'customer/account/login/'

  #2 - navigate to registration
  visit(registration)
  current_url.should eq(registration),
    "Expected the current url to be #{registration}, but it was #{current_url}"
end

When(/^I login with valid informations$/) do
  #1 - initialize variables
  eMail = user.eMail
  password = user.password

  url = current_url
  field_eMail = '#email'
  field_password = '#pass'
  button_login_id = 'send2'
  button_login_text = "anmelden"

  #2 - fill eMail input field
  element = page.find(field_eMail)
  element.set(eMail)
  out "fill eMail input field"

  #3 - fill password input field
  element = page.find(field_password)
  element.set(password)
  out 'fill password input field'

  #4 - click login button
  element = page.find_button(button_login_id)
  element.text.should eq(button_login_text),
    "expected the text of the login button to be '#{button_login_text}', but it was '#{element.text}'"

  element.click
  out 'click login button'
  current_url.should_not eq(url),
    "clicked the login button but did not change the url"
end

Then(/^I should be on my account page$/) do
  #1 - initialize variables
  url_accountPage = settings.urlHttps+'customer/account/'
  

  #2 - check url
  current_url.should include(url_accountPage),
    "expected to be on my account page, but was on #{current_url}"
end

When(/^I create an new account with my data$/) do
  #1 - initialize variables
  eMail = user.eMail
  password = user.password
  company = user.company
  firstName = user.firstname
  lastName = user.lastname
  prefix = user.prefix
  street = user.street
  postcode = user.postcode
  city = user.city
  telephone = user.telephone

  url_createAccount = settings.urlHttps+"customer/account/create/"
  button_createAccount = 'div.new-users > div > button'
  button_sendFormular = '#form-validate > div.buttons-set.form-buttons > button'


  #2 - click "create account" button
  element = page.find(button_createAccount)
  element.click
  current_url.should eq(url_createAccount),
    'did not visit the createAccount-page after clicking the "create account" button'
  out 'click "create account" button'

  #3 - fill formular
  out 'fill formular'
  page.find('#company')
  element = page.find('#company')
  element.set(company)
  out "- company: #{company}"

  element = page.find('#owner_firstname')
  element.set(firstName)
  out "- owner first name: #{firstName}"

  element = page.find('#owner_lastname')
  element.set(lastName)
  out "- owner last name: #{lastName}"

  element = page.find('#prefix')
  element.select(prefix)
  out "- prefix: #{prefix}"

  element = page.find('#firstname')
  element.set(firstName)
  out "- user first name: #{firstName}"

  element = page.find('#lastname')
  element.set(lastName)
  out "- user last name: #{lastName}"

  element = page.find('#street_1')
  element.set(street)
  out "- street: #{street}"

  element = page.find('#postcode')
  element.set(postcode)
  out "- postcode: #{postcode}"

  element = page.find('#city')
  element.set(city)
  out "- city: #{city}"

  element = page.find('#password')
  element.set(password)
  out "- password: #{password}"

  element = page.find('#confirmation')
  element.set(password)

  element = page.find('#telephone')
  element.set(telephone)
  out "- telephone: #{telephone}"

  element = page.find('#email_address')
  element.set(eMail)
  out "- eMail: #{eMail}"

  #3 - send formular
  element = page.find(button_sendFormular)
  element.click
  out 'clicked send button'
  current_url.should_not eq(url_createAccount),
    'could not send the formular'
end
