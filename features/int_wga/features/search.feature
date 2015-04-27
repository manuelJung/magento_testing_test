@search
@selenium
Feature: search

	As a customer
	I want to have the opportunity to search for my favorite article


	
	Scenario: search by sku

		Given I am on the vega-homepage
		When I search for an article by entering the sku in the search-input-field
		Then I should be on the product page of this article