@direct_ordering
@selenium
Feature: direct ordering

	As a customer
	I want to have the opportunity to add an article to the cart, by simply opening a form and entering the sku and amount of this article


	
	Scenario: add an article

		Given I am on the vega-homepage
		When I add an article by direct ordering
		Then I should see a box which tells me, that I added my article
		Then I should see this article in the product cart