  Feature: Convert one currency to another
    In order to get currency exchange
    A user
    Should be able to convert some amount of money from one currency to another

    Scenario Outline: Convert currencies with correct names
      Given an instance of Converter with valid source data hash
        When I call convert method with <amount> <from> to <to>
        Then I should get <amount> <from> equals <value> <to>

        Examples:
          |amount|from |to   |value|
          |   543|"USD"|"EUR"|  468|
          |     5|"USD"|"usd"|    5|
          |     1|"byn"|"UsD"|    0|
          |   100|"byn"|"UsD"|   42|
          |   100|"usD"|"BYn"|  239|

    Scenario: Convert currencies with unknowing names
      Given an instance of Converter with valid source data hash
        When I try to convert 'UUU' currency
        Then convert return nil
