Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings


Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
  And  I am on the home page

Scenario: restrict to movies with 'PG' or 'R' ratings
  # enter step(s) to check the 'PG' and 'R' checkboxes
  When I check the following ratings: PG, R
  # enter step(s) to uncheck all other checkboxes
  And I uncheck the following ratings: G, PG-13, NC-17
  # enter step to "submit" the search form on the homepage
  And I press "Refresh"
  # enter step(s) to ensure that PG and R movies are visible
  Then I should see all of the movies with the following rating: G, PG, PG-13, NC-17, R

Scenario: all ratings selected
  # see assignment
  Given I am on the movies page
  When I check the following ratings: G, PG-13, PG, R, NC-17
  And I press "Refresh"
  Then I should see all of the movies
