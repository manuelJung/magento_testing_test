When(/^I fill out the personal information formular$/) do
  #1 - initilalize variables
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

  #4 - fill formular
  out 'fill formular'

  element = page.find('#billing\3a company')
  element.set(company)
  out "- company: #{company}"

  element = page.find('#billing\3a owner_firstname')
  element.set(firstName)
  out "- owner first name: #{firstName}"

  element = page.find('#billing\3a owner_lastname')
  element.set(lastName)
  out "- owner last name: #{lastName}"

  element = page.find('#billing\3a prefix')
  element.select(prefix)
  out "- prefix: #{prefix}"

  element = page.find('#billing\3a firstname')
  element.set(firstName)
  out "- first name: #{firstName}"

  element = page.find('#billing\3a lastname')
  element.set(lastName)
  out "- last name: #{lastName}"

  element = page.find('#billing\3a street1')
  element.set(street)
  out "- street: #{street}"

  element = page.find('#billing\3a postcode')
  element.set(postcode)
  out "- postcode: #{postcode}"

  element = page.find('#billing\3a city')
  element.set(city)
  out "- city: #{city}"

  element = page.find('#billing\3a telephone')
  element.set(telephone)
  out "- telephone: #{telephone}"

  element = page.find('#billing\3a email')
  element.set(eMail)
  out "- eMail: #{eMail}"

  if page.has_css? '#billing\3a customer_password'
    element = page.find('#billing\3a customer_password')
    element.set(password)
    out "- password: #{password}"

    element = page.find('#billing\3a confirm_password')
    element.set(password)
  end
  
  # - scroll down in oder that the "Trusted Shops Icon" wont cover the button
  page.execute_script "window.scrollBy(0,10000)"

  element = page.find('#billing-buttons-container > button')
  element.click
  out 'click "next" button'
end

When(/^I confirm AGB$/) do
  element = page.find('#agreement-checkbox').find('input')
  element.click
  out 'confirm AGB by checking checkbox'

  element = page.find('#shipping-method-buttons-container > button')
  element.click
  out 'click "ahead" button'
end

When(/^I choose pay method$/) do
  element = page.find('#p_method_bankpayment')
  element.click
  out 'choose pay method: "Vorkasse"'
  
  # - scroll down in oder that the "Trusted Shops Icon" wont cover the button
  page.execute_script "window.scrollBy(0,10000)"

  element = page.find('#payment-buttons-container > button')
  element.click
  out 'click "ahead" button'
end

Given(/^I am on the checkout page$/) do
  #1 - initilalize variables
  checkout = urlHttps+'checkout/onepage/'
  

  # - navigate to checkout
  visit(checkout)
  current_url.should eq(checkout),
    "Expected the current url to be #{checkout}, but it was #{current_url}"
end

When(/^I send a correctly filled checkout formular without existing account and without creating an account$/) do
  #1 - initilalize variables
  

  #2 - click radio button
  element = page.find('#login\3a guest')
  element.click
  out 'click radio button "loggin as guest"'

  #3 - click "go" button
  element = page.find('#checkout-step-login > div > div.col-2 > div > button')
  element.click
  out 'click "go" button'

  #4 - fill formular
  step("I fill out the personal information formular")
  step("I confirm AGB")
  step("I choose pay method")
  
  # - scroll down in oder that the "Trusted Shops Icon" wont cover the button
  page.execute_script "window.scrollBy(0,10000)"
  
  #7 - send formular
  element = page.find('#review-buttons-container > button')
  element.click
  out 'click "send" button'
end

When(/^I send a correctly filled checkout formular with existing account$/) do
  #1 - initilalize variables

  #3 - choose invoice address
  element = page.find('#checkoutSteps').find('#opc-billing')
  element = element.find('#billing-buttons-container > button')#billing-buttons-container > button > span > span #payment-buttons-container > button
  element.click
  out 'choose invoice address "deliver to my address"'

  #4 - fill formular
  step("I confirm AGB")
  step("I choose pay method")

  #6 - send formular
  element = page.find('#review-buttons-container > button')##review-buttons-container > button
  element.click
  out 'click "send" button'
end

When(/^I send a correctly filled checkout formular without existing account and with creating an account$/) do
  #1 - initilalize variables

  #2 - click radio button
  element = page.find('#login\3a register')
  element.click
  out 'click radio button'

  #3 - click "go" button
  element = page.find('#checkout-step-login > div > div.col-2 > div > button')
  element.click
  out 'click "go" button'

  #4 - fill formular
  step("I fill out the personal information formular")
  step("I confirm AGB")
  step("I choose pay method")

  #7 - send formular
  element = page.find('#review-buttons-container > button')
  element.click
  out 'click "send" button'
end

Then(/^Magento should have my order$/) do
  #1 - initialize variables

  #2 - search for success text
  page.find('body > div.wrapper > div > div.cont > div.main.col1-layout > div > div.page-title')
  sleep 5
            #body > div.wrapper > div > div.cont > div.main.col1-layout > div > div.page-title
            #body > div.wrapper > div > div.cont > div.main.col1-layout > div > div.success-page-trustedrating > div > h1

  #element = page.find('body > div.wrapper > div > div.cont > div.main.col1-layout > div > div.page-title')
  

  #3 - get transaction ID
  element = page.find('body > div.wrapper > div > div.cont > div.main.col1-layout > div > form > input[type="hidden"]:nth-child(1)', :visible => false)
  transactionID = element.value
  out "transaction ID: #{transactionID}"

  #4 - cancel order
  cancel = magento.order_cancel(transactionID)
  out "canceled order: #{cancel}"
end

Then(/^I should have a user account$/) do
  #1 - initilalize variables
  eMail = user.eMail

  #2 - search for user account
  magento.customer_exists(eMail)
end

