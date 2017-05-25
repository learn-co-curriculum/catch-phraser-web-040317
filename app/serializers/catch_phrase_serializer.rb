class CatchPhraseSerializer <  ActiveModel::Serializer
    attributes :id, :nsfw, :content, :mood, :student_id
    belongs_to :student
    def nsfw
      !object.suitable_for_work
    end
end


# class Dog
#
#   def name
#     "Fido"
#   end
#
#   #... 13 methods
# end
#
#
# class BarkingDog < SimpleDelegator
#
#   # def initialize(obj)
#   #   @obj = obj
#   # end
#   #
#   # def method_missing(method, *args)
#   #   @obj.send(method, *args)
#   # end
#
#   def bark
#     puts "Woof"
#   end
# end
#
# dog = Dog.new
# barking_dog = BarkingDog.new(dog)
#
# barking_dog.zorp!
