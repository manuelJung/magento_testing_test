@product_page
@selenium
Feature: product page

	As a customer,
	I want to have the opportunity to have access to my favority product


	Scenario: add an article to the product cart by clicking button above the product-list

		Given I am on the product page of an article
		When I add an article to the product cart by clicking the button above the product-list
		Then I should see a confirm-box
		And I should see this article in the product cart


	Scenario: add an article to the product cart by button right to the product-list

		Given I am on the product page of an article
		When I add an article to the product cart by clicking the button right to the product-list
		Then I should see a confirm-box
		And I should see this article in the product cart

	
	Scenario: display products with data

		Given I am on the product page of an article
		Then I should see all necessary informations about this article within the product list of the product product page