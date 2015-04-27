Given(/^I am on the product page of an article$/) do
  #1 - initialize variables
  

  #2 - visit vega homepage
  step("I am on the vega-homepage")
  
  #3 - search for sku
  step("I search for an article by entering the sku in the search\-input\-field")
  step("I should be on the product page of this article")
end

When(/^I add an article to the product cart by clicking the button above the product\-list$/) do
  #1 - initialize variables
  sku = article.sku
  amount = article.amount

  collumn = 'li#standardset > div.a-item > table > tbody.grouped-product-row'
  css_amount = 'td.filter-qty.acc-quantity > input.input-text.qty'
  button_send = '#pre-cart-content > div > button'

  #2 - fill formular
  page.find(collumn, text: sku)
  element = page.find(collumn, text: sku)

  element = element.find(css_amount)
  element.set(amount)
  out 'fill quantity input field'

  #3 - button appears
  page.find('#standardset').click

  #4 - send formular
  page.find(button_send)
  element = page.find(button_send)
  element.click
  out 'click button above the product list'

end

When(/^I add an article to the product cart by clicking the button right to the product\-list$/) do
  #1 - initialize variables
  sku = article.sku
  amount = article.amount

  collumn = 'li#standardset > div.a-item > table > tbody.grouped-product-row'
  css_amount = 'td.filter-qty.acc-quantity > input.input-text.qty'
  button_send = 'button.acc-cart'

  #2 - fill formular
  page.find(collumn, text: sku)
  element = page.find(collumn, text: sku)

  field = element.find(css_amount)
  field.set(amount)
  out 'fill quantity input field'

  #3 - send formular
  element.find(button_send).click
  out 'click buton right to the product list'
end

Then(/^I should see a confirm\-box$/) do
  page.has_css?('#j2t_ajax_confirm', :visible => true)
end

Then(/^I should see all necessary informations about this article within the product list of the product product page$/) do
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

  collumn = 'li#standardset > div.a-item > table > tbody.grouped-product-row'

  #2 - find article
  page.find(collumn, text: sku)
  element = page.find(collumn, text: sku)

  #3 - find name
  item = element.find('td.filter-name.acc-name')
  item.has_text?(name)
  out "- name: #{item.text}"

  #4 - find sku
  item = element.find('td.filter-sku')
  item.has_text?(sku)
  out "- sku: #{item.text}"

  #5 - find color
  item = element.find('td.filter-color')
  item.has_text?(color)
  out "- color: #{item.text}"

  #6 - find size
  item = element.find('td.filter-dimension')
  item.has_text?(size)
  out "- size: #{item.text}"

  #7 - find pack content
  item = element.find('td.filter-packing_amount')
  item.has_text?(packagingUnit)
  out "- pack content: #{item.text}"

  #8 - find price per piece
  item = element.find('td.filter-price')
  item.has_text?(pricePerPiece)
  out "- price per piece: #{item.text}"

  #9 - find price per pack
  pppNet = packContent*pricePerPiece

  item = element.find('td.filter-price_per_package > span > span')
  item.has_text?(pppNet)
  out "- price per pack (net): #{item.text}"

  #9 - find price per pack
  # item = element.find('#gross-price > span.price')
  # item.has_text?(pppNet+(pppNet*vat))
  # out "- price per pack (gross): #{item.text}"
end
