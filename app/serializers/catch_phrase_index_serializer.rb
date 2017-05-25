class CatchPhraseIndexSerializer <  ActiveModel::Serializer
    attributes :id, :nsfw, :content, :mood, :student_id

    def nsfw
      !object.suitable_for_work
    end
end
