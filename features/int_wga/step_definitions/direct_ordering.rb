


When(/^I add an article by direct ordering$/) do
  #1 - initilalize variables
  sku = article.sku
  amount = article.amount

  formular = 'body > div.wrapper > div > div.header-container > div.header > div.header-panel > div > div.quick-access > div > span'
  skuInputField = '#direct-shoping > div > ul > li:nth-child(2) > div.input-box.input-box-large.ajax-order-input > input'
  amountInputField = '#direct-shoping > div > ul > li:nth-child(2) > div:nth-child(2) > input'
  sendButton = '#send2 > span > span'

  #2 - open formular for direct ordering
  element = page.find(formular)
  element.click
  out 'opened formular for direct ordering'

  #3 - fill formular
  element = page.find(skuInputField)
  element.set(sku)
  out "filled sku input field: #{sku}"
  
  element = page.find(amountInputField)
  element.set(amount)
  out "filled quantitiy input field: #{amount}"

  #4 - send formular
  element = page.find(sendButton)
  element.click
  out 'clicked send button'
end

Then(/^I should see a box which tells me, that I added my article$/) do
  #1 - initilalize variables
  name = article.name
  amount = article.amount

  showBox = '#dynamicTopCartContent'
  css_name = '#cart-sidebar > li > div > p'
  css_amount = '#cart-sidebar > li > div > div.dynamictopcart-product-amount'

  # search for showBox
  page.find(showBox, :visible => true)
  # box = page.find(showBox, :visible => true)
  
  # element = box.find(css_name)
  # element.has_text? name

  # element = box.find(css_amount)
  # element.has_text? amount
end



