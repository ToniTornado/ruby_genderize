module RubyGenderize
  class Gender
    attr_reader :name, :gender, :probability, :count

    def initialize name: "", gender: nil, probability: 0.0, count: 0
      @name        = name
      @gender      = gender
      @probability = probability
      @count       = count
    end

    def male?
      @gender == "male"
    end

    def female?
      @gender == "female"
    end

    def unknown?
      @gender.nil?
    end

    def == another_gender
      @gender == another_gender.gender
    end
  end
end
