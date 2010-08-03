Feature: contouring can be recorded

	In order to record game activity
	As a game researcher
	I want to log players contouring of imaging data
	
	Scenario: contouring is recorded
		Given a game session started elsewhere
			When I send the game session to the session controller
			Then I should see the session data in return
		Given a contouring
			When I send the contouring data to the contouring controller
			Then I should see the contouring data in return
