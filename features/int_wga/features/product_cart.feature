@product_cart
@selenium
Feature: product cart

	As a customer
	I want to have a product cart
	in order to be able to cache my favorite products for further process



	Scenario: remove an article

		Given the product cart contains an article
		And I am on the product cart page
		When I remove this article from the product cart
		Then the cart should not contain this article 

	
	Scenario: display articles with data

		Given the product cart contains an article
		And I am on the product cart page
		Then I should see all necessary informations about this article within the product list of the product cart

	
	Scenario: navigate to checkout

		Given the product cart contains an article
		And I am on the product cart page
		When I navigate to the checkout by clicking the button which navigates to the checkout
		Then I should be on the checkout-page


	Scenario: display were worth

		Given the product cart contains an article
		And I am on the product cart page
		Then I should see the were worth of this article

