require 'rspec'
require 'test.rb'

describe 'logic of evaluate_result' do
  before :each do
    @test = Test.new(__dir__ + '/fixtures/questions.txt', __dir__ + '/fixtures/results.txt')
  end
  context 'when test just started' do
    it 'returns 6th element of result array' do
      expect(@test.evaluate_result).to include('3 балла или менее.')
      result1 = @test.results[6]
      result2 = @test.evaluate_result
      expect(result1).to eq result2
    end
  end

  context 'when all questions asked' do
    it 'result must include "string"' do
      responce = @test.print_result
      expect(responce).to include('30 31 балл. Что скрывать')
    end
  end
end

describe 'initialized values' do
  before :each do
    @test = Test.new(__dir__ + '/fixtures/questions.txt', __dir__ + '/fixtures/results.txt')
  end
  it 'returns array of content' do
    @test.results.each do |result|
      expect(result).to include('баллов').or include('балл')
    end
  end
end