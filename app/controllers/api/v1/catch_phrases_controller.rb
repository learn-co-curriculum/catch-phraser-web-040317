class Api::V1::CatchPhrasesController < ApplicationController

  def index
    catch_phrases = CatchPhrase.all
    render json: catch_phrases, each_serializer: CatchPhraseIndexSerializer
  end

  def create
    if params[:student].present?
      student = Student.find_or_create_by(student_params)
      catch_phrase = student.catch_phrases.build(catch_phrase_params)
    else
      catch_phrase = CatchPhrase.new(catch_phrase_params)
    end

    if catch_phrase.save
      render json: catch_phrase
    else
      render json: 'Error!', status: 404
    end
  end

  def show
    catch_phrase = CatchPhrase.find(params[:id])
    render json: catch_phrase
  end

  private

  def catch_phrase_params
    params.require(:catch_phrase).permit(:suitable_for_work, :mood, :content, :student_id)
  end

  def student_params
    params.require(:student).permit(:name)
  end
end
