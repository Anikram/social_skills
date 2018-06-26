require_relative 'question'

class Test

  attr_reader :score, :results

  def initialize(q_path,r_path)
    @title = "Тест социальных навыков"
    @questions = Question.read_from_file(q_path)
    @score = 0
    @results = load_results(r_path)
  end

  def calculate_result
    if score >= 0 && score < 4
      results[6]
    elsif score >= 4 && score < 9
      results[5]
    elsif score >= 9 && score < 14
      results[4]
    elsif score >=14 && score < 19
      results[3]
    elsif score >=19 && score < 25
      results[2]
    elsif score >=25 && score < 35
      results[1]
    else
      results[0]
    end
  end

  def print_result
   puts "\nВаш результат:\n\n\n #{calculate_result}"
  end

  def start_test
    @questions.each_with_index do |question, index|
      puts "#{index+1}. #{question.read_question}"
      puts "\nВыбирите вариант из предложенных вариантов:\n"
      puts question.read_answers

      evaluate_user_input(get_user_input)
    end
  end

  def load_results(path)
    File.readlines(path)
  end

  def get_user_input
    user_input = nil

    until %w(а б в).include?(user_input) do
      user_input = STDIN.gets.chomp.downcase
    end

    user_input
  end

  def evaluate_user_input(input)
    if input == 'а'
      @score += 2
    elsif input == 'в'
      @score += 1
    end
  end
end
