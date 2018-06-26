require_relative 'lib/test'

test = Test.new('data/social_test_questions.txt', 'data/social_test_results.txt')

test.start_test

test.print_result

