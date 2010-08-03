Feature: patient visits can be recorded

	In order to record game activity
	As a game researcher
	I want to log players decisions in patient visits
	
	Scenario: patient visit is recorded
		Given a game session started elsewhere
			And a patient visit
		When I send the patient visit to the patient visit controller
		Then I should see the patient visit data in return
