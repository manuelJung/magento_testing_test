@checkout
Feature: checkout

	As a customer,
	I want to be able to buy my favorite products

	
	Scenario: checkout with existing account

		Given I already created an user account
		And I am logged in
		And the product cart contains an article
		And I am on the checkout page
		When I send a correctly filled checkout formular with existing account
		Then Magento should have my order


	
	Scenario: checkout without existing account and without creating an account

		Given the product cart contains an article
		And I am on the checkout page
		When I send a correctly filled checkout formular without existing account and without creating an account
		Then Magento should have my order

	
	Scenario: checkout without existing account and with creating an account

		Given the product cart contains an article
		And no user account with my data exists
		And I am on the checkout page
		When I send a correctly filled checkout formular without existing account and with creating an account
		Then Magento should have my order
		And I should have a user account