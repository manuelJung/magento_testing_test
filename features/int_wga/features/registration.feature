@registration
Feature: registration

	As a customer,
	I want to be able to create an account and login  
	in order to manage my user data

	
	Scenario: create new account

		Given no user account with my data exists
		And I am on the registration page
		When I create an new account with my data
		Then I should be on my account page

	
	Scenario: login with existing account

		Given I already created an user account
		And I am on the registration page
		When I login with valid informations
		Then I should be on my account page


	#Scenario: logout



	