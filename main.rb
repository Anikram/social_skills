require_relative 'lib/social_test'

test = SocialTest.new('data/social_test_questions.txt','data/social_test_results.txt')

test.start_test

test.print_result

