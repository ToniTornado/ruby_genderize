require 'open-uri'
require 'json'

module RubyGenderize
  API_BASE_URI = "http://api.genderize.io"

  class Guesser
    def self.male? name
      gender = guess_gender name
      gender.male?
    end

    def self.female? name
      gender = guess_gender name
      gender.female?
    end

    def self.guess_gender name
      genderize_json = read_genderize_api name
      genderize_hash = convert_json_hash_to_ruby_hash genderize_json
      initialize_gender_from_hash genderize_hash
    end

    def self.read_genderize_api name
      uri = URI.escape(API_BASE_URI + "?name=#{name}&country_id=de")
      open(uri).read
    end

    def self.convert_json_hash_to_ruby_hash json_hash
      JSON.load json_hash
    end

    def self.initialize_gender_from_hash hash
      Gender.new        name: hash.fetch("name", ""),
                      gender: hash.fetch("gender", nil),
                 probability: hash.fetch("probability", 0.0),
                       count: hash.fetch("count", 0)
    end
    private_class_method :read_genderize_api, :convert_json_hash_to_ruby_hash, :initialize_gender_from_hash
  end
end
