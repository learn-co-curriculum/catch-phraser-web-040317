class Api::V1::CatchPhrasesController < ApplicationController

  def index
    catch_phrases = CatchPhrase.all
    render json: catch_phrases
  end

  def create
    # this should create a new catch phrase
  end
end
