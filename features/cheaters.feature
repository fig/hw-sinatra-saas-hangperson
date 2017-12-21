Feature: cheaters

  As a cheater playing Hangperson
  So that I will be thwarted
  I want to be put back on the righteous path

  Scenario: I try and cheat

    Given I start a new game with word "foobar"
    When I try to go to the URL "/win"
    Then I should be on the show page

  Scenario: I try and lose

    Given I start a new game with word "foobar"
    When I try to go to the URL "/lose"
    Then I should be on the show page
