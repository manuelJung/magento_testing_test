Given(/^I am on the product cart page$/) do
  #1 - initialize variables
  url = settings.urlHttp+'checkout/cart/'

  #2 - navigate to product cart
  visit(url)
  current_url.should eq(url),
    "Expected the current url to be #{url}, but it was #{current_url}"
end

When(/^I remove this article from the product cart$/) do
  #1 - initilalize variables
  sku = article.sku

  tableCollumn = '#shopping-cart-table > tbody > tr'

  #2 - remove article
  page.find(tableCollumn, text: sku)
  element = page.find(tableCollumn, text: sku)
  element = element.find('td.a-center.last > a')
  element.click
  out "remove article by clicking the delete button in the product cart table"
end

Then(/^the cart should not contain this article$/) do
  #1 - initilalize variables
  sku = article.sku
  amount = article.amount

  #2 - accept alertbox respectively confirmbox
  page.driver.browser.switch_to.alert.accept
  #out "accepted the confirmbox"

  #3 - search for article
  page.has_no_css?('#shopping-cart-table > tbody')
end

Then(/^I should see all necessary informations about this article within the product list of the product cart$/) do
  #1 - initilalize variables
  name = article.name
  sku = article.sku
  amount = article.amount
  color = article.color
  size = article.size
  packagingUnit = article.packagingUnit
  deliveryState = article.deliveryState
  pricePerPiece = article.pricePerPiece
  packContent = article.packContent

  tableCollumn = '#shopping-cart-table > tbody > tr'

  #2 - find article
  page.find(tableCollumn, text: sku)
  element = page.find(tableCollumn, text: sku)

  #3 - find product attributes
  attributes = element.find('td:nth-child(2)')
  attributes.has_text?(name)
  out "- name: #{name}"
  attributes.has_text?(sku)
  out "- sku: #{sku}"
  attributes.has_text?(color)
  out "- color: #{color}"
  attributes.has_text?(size)
  out "- size: #{size}"
  attributes.has_text?(packagingUnit)
  out "- packaging unit: #{packagingUnit}"

  #4 - find delivery state
  item = element.find('td:nth-child(3)')
  item.has_text?(deliveryState)
  out "- delivery state: #{deliveryState}"

  #5 - find pack content
  item = element.find('td:nth-child(4) > ul > li')
  item.has_text?("Packinhalt: #{packContent}")
  out "- pack content: #{packContent}"

  #6 - find price per piece
  item = element.find('td:nth-child(4) > ul > li')
  item.has_text?("(#{pricePerPiece} &euro;/St&uuml;ck)")
  out "- price per piece: #{pricePerPiece}"

  #7 - find pack price
  item = element.find('td:nth-child(4) > span > span > span')
  item.has_text?(pricePerPiece*packContent)
  out "- pack price: #{pricePerPiece*packContent}"

  #8 - find quantity
  item = element.find('td:nth-child(5) > input')
  item.has_text?(amount)
  out "- quantity: #{amount}"

  #9 - find subtotal
  subtotal = pricePerPiece*packContent*amount
  item = element.find('td:nth-child(6) > span > span')
  item.has_text?(subtotal)
  out "- subtotal: #{subtotal}"
end

When(/^I navigate to the checkout by clicking the button which navigates to the checkout$/) do
  #1 - initialize variables
  button_checkout = 'body > div.wrapper > div > div.cont > div.main.col1-layout > div > div.cart > div.page-title.title-buttons > ul > li:nth-child(2) > button'

  #2 - navigate to checkout by clicking button
  find(button_checkout)
  element = page.find(button_checkout)
  element.click
  out 'click the button which navigates to the checkout'
end

Then(/^I should be on the checkout\-page$/) do
  #1 - initilalize variables
  checkout = settings.urlHttps+'checkout/onepage/'

  #2 - check url
  current_url.should eq(checkout),
    "Expected the current url to be #{checkout}, but it was #{current_url}"
end

Then(/^I should see the were worth of this article$/) do
  #1 - initilalize variables
  

  #2 - find were worth
  page.find('#shopping-cart-totals-table')
  path = page.find('#shopping-cart-totals-table')

  element = path.find('tbody > tr:nth-child(1)')
  element.has_text?('Zwischensumme')
  out "- subtotal: #{element.find('td:nth-child(2) > span').text}"

  element = path.find('tbody > tr:nth-child(2)')
  element.has_text?('Versand (Standard - Versandkosten)')
  out "- shipping costs: #{element.find('td:nth-child(2) > span').text}"

  element = path.find('tfoot > tr:nth-child(1)')
  element.has_text?('Warenwert (Netto)')
  out "- were worth (net): #{element.find('td:nth-child(2) > strong > span').text}"

  element = path.find('tfoot > tr:nth-child(2)')
  element.has_text?('19% Mwst')
  out "- 19% VAT: #{element.find('td:nth-child(2) > span').text}"

  element = path.find('tfoot > tr:nth-child(3)')
  element.has_text?('Warenwert (Brutto)')
  out "- were worth (gross): #{element.find('td:nth-child(2) > strong > span').text}"
end
