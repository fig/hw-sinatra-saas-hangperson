Feature: start new game

  As a player
  So I can play Hangperson
  I want to start a new game

Scenario: I start a new game

  Given I am on the home page
  When I press "New Game"
  Then I should be on the show page
  And I should see "Guess a letter"
  When I press "New Game"
  Then I should see "Guess a letter"
