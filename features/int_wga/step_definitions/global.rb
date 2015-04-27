

Given(/^I am on the vega\-homepage$/) do
  #1 - initialize variables
  homepage = urlHttp

  #2 - navigate to homepage
  visit(homepage)
  current_url.should eq(homepage),
    "Expected the current url to be #{homepage}, but it was #{current_url}"
  out ENV['MAGENTO_USERNAME']
  out ENV['MAGENTO_PASSWORD']
end

Given(/^no user account with my data exists$/) do
  #1 - initialize variables
  eMail = user.eMail

  #2 - delete user
  if magento.customer_exists(eMail)
    cancel = magento.delete_customers(eMail)
    out "deleted customer: #{cancel}"
  end
end

Given(/^I already created an user account$/) do
  #1 - initialize variables
  eMail = user.eMail
  
  url_logoutSuccess = urlHttps+"customer/account/logoutSuccess/"
  url_homepage = urlHttp
  button_logout = 'body > div.wrapper > div > div.header-container > div.header > div.header-panel > div > div.footer-links > ul > li.last > a'

  if magento.customer_exists(eMail) == false
    step("I am on the registration page")
    step("I create an new account with my data")
    step("I should be on my account page")

    #click logout button
    element = page.find(button_logout)
    element.click
    out 'clicked "logout" button'
    current_url.should eq(url_logoutSuccess),
     "was not redirected to success page #{url_logoutSuccess} after logging out"

    #wait for redirect to homepage
    10.times {break if(current_url == url_homepage); sleep 1}
    current_url.should eq(url_homepage),
     "was not redirected to homepage after logging out"
  end
end

Given(/^I am logged in$/) do
  #1 - initialize variables
  
  # loggin
  step("I am on the registration page")
  step("I login with valid informations")
  step("I should be on my account page")
end

Given(/^the product cart contains an article$/) do
  #1 - initilalize variables


  #2 - navigate to homepage
  step("I am on the vega\-homepage")
  out "navigated to homepage"

  #3 - add article by direct-ordering
  step("I add an article by direct ordering")
  step("I should see a box which tells me, that I added my article")
  
end

Then(/^I should see this article in the product cart$/) do
  #1 - initilalize variables
  

  #2 - navigate to product cart
  step("I am on the product cart page")
  out "navigated to product cart"

  #3 - find article and amount
  step("I should see all necessary informations about this article within the product list of the product cart")
end