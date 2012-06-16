#
# = rattler/compiler/optimizer/join_predicate_or_match.rb
#
# Author:: Jason Arhart
# Documentation:: Author
#
require 'rattler/compiler/optimizer'

module Rattler::Compiler::Optimizer
  #
  # A predicate and an adjacent Regexp match in a Choice can be joined into a
  # single Regexp match.
  #
  # @author Jason Arhart
  #
  JoinPredicateOrMatch = JoinPredicateOrBareMatch >> JoinPredicateOrNestedMatch
end