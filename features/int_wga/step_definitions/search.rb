When(/^I search for an article by entering the sku in the search\-input\-field$/) do
  #1 - initilalize variables
  sku = article.sku

  url = current_url
  searchField = '#search'
  button_search = '#search_mini_form > div > button'

# page.driver.browser.save_screenshot 'output/screenshots/search_inputSKU.png'
  #2 - input sku in search-field
  page.find(searchField)
  element = page.find(searchField)
  element.set(sku)
  element.value.should eq(sku),
    "value of search-field should be #{sku}, but it was #{element.value}"
  out "input sku '#{sku}' in search-field"

  #4 - click search button
  element = page.find(button_search)
  element.click
  current_url.should_not eq(url),
    "did not visit the product-page after clicking the search button"
  out "click search button"
end

Then(/^I should be on the product page of this article$/) do
  #1 - initilalize variables
  name = article.name

  productpage_headline = '#product_addtocart_form > div.product-essential > div.product-shop > div.product-main-info > div.product-name > h1'

  #2 - find article
  element = page.find(productpage_headline)
  element.has_text? name
end
