Feature: sessions can be created

	In order to record game activity
	As a game researcher
	I want to log play sessions
	
	Scenario: game session is created
		Given a game session started elsewhere
		When I send the game session to the session controller
		Then I should see the session data in return
		