require_relative 'question'

class Test

  attr_accessor :results, :score

  def initialize(q_path,r_path)
    @title = "Тест социальных навыков"
    @questions = Question.read_from_file(q_path)
    @score = 0
    @results = load_results(r_path)
  end

  def evaluate_result
    case score
    when 0...4 then results[6]
    when 4...9 then results[5]
    when 9...14 then results[4]
    when 14...19 then results[3]
    when 19...25 then results[2]
    when 25..29 then results[1]
    else results[0]
    end
  end

  def print_result
   "\nВаш результат:\n\n\n #{evaluate_result}"
  end

  def start_test
    @questions.each_with_index do |question, index|
      puts "\n\n"
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

    until [1, 2, 3].include?(user_input) do
      user_input = STDIN.gets.to_i
    end

    user_input
  end

  def evaluate_user_input(input)
    if input == 1
      @score += 2
    elsif input == 3
      @score += 1
    end
  end
end
