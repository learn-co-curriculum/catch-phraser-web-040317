class Api::V1::CatchPhrasesController < ApplicationController

  def index
    catch_phrases = CatchPhrase.all
    render json: catch_phrases
  end

  def create
    # this should create a new catch phrase
    @catch_phrase = CatchPhrase.new(
      catch_phrase_params(
        :suitable_for_work,
        :mood,
        :content,
        :student_id
      )
    )
    if @catch_phrase.save()
      render json: @catch_phrase
    end
  end

  # def show
  #   byebug
  #   catch_phrase = CatchPhrase.find_by(id: params[:id])
  #   render json: catch_phrase
  # end

  def catch_phrase_params(*args)
    params.require(:catch_phrase).permit(*args)
  end
end
