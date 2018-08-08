class Question
  def self.read_from_file(path)
    raw_questions = File.readlines(path)
    questions = []

    raw_questions.each do |question|
      questions << Question.new(question)
    end

    questions
  end

  def initialize(question)
    @question = question
    @answers = "1). да, 2). нет, 3). иногда"
  end

  def read_question
    @question
  end

  def read_answers
    @answers
  end
end
