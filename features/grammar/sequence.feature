Feature: Sequence Expressions
  
  A sequence expression is a series of sub-expressions and it means to match
  all of the sub-expressions in sequence, otherwise fail and consume no input.
  
  In order to define an expression as a sequence of sub-expressions
  As a language designer
  I want to use sequence expressions in my grammar
  
  Scenario Outline: Parsing
    Given a grammar with:
      """
      expr <- "A" "B"
      """
    When I parse <input>
    Then the parse result should be <result>
  
  Examples:
    | input | result     |
    | "AB"  | ["A", "B"] |
    | "ABC" | ["A", "B"] |
    | "ACB" | FAIL       |
    | "A"   | FAIL       |
    | "C"   | FAIL       |