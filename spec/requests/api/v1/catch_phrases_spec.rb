require 'rails_helper'

describe "Catch Phrases API" do
  context 'listing all catch phrases' do
    before do
      student = Student.create
      CatchPhrase.create([
        {
          suitable_for_work: true,
          mood: 'angry',
          content: 'I pity the fool',
          student: student
        },
        {
          suitable_for_work: true,
          mood: 'funny',
          content: 'Veeeery Nice', student: student
      }])

      get "/api/v1/catch_phrases"
    end

    it 'returns a 200 status code' do
      expect(response).to be_success
    end

    it "can list out all of the catch phrases" do
      data = JSON.parse(response.body)
      expect(data.length).to eq(2)
    end
  end

  context 'creating new catch phrases' do

    it 'should return a 200 status code' do
      student = Student.create
      post '/api/v1/catch_phrases', params: {catch_phrase: {suitable_for_work: true, mood: 'funny', content: 'Veeeery Nice', student_id: student.id}}
      expect(response).to be_success
    end

    it 'should create a new catch phrase' do
      student = Student.create
      post '/api/v1/catch_phrases', params: {catch_phrase: {suitable_for_work: true, mood: 'funny', content: 'Veeeery Nice', student_id: student.id}}
      expect(CatchPhrase.count).to eq(1)
    end

    it 'should respond with the new catch phrase data' do
      student = Student.create
      post '/api/v1/catch_phrases', params: {catch_phrase: {suitable_for_work: true, mood: 'funny', content: 'Veeeery Nice', student_id: student.id}}
      data = JSON.parse(response.body)
      expect(data["content"]).to eq('Veeeery Nice')
    end
  end
end
