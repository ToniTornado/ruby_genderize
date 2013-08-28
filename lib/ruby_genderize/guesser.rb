require 'open-uri'
require 'json'

module RubyGenderize
  API_BASE_URI = "http://api.genderize.io"

  class Guesser
    def self.male? name
      gender = guess_gender name
      gender == "male"
    end

    def self.female? name
      gender = guess_gender name
      gender == "female"
    end

    def self.guess_gender name
      genderize_json = read_genderize_api name
      genderize_hash = convert_json_hash_to_ruby_hash genderize_json
      genderize_hash["gender"]
    end

    def self.read_genderize_api name
      open(API_BASE_URI + "?name=#{name}").read
    end

    def self.convert_json_hash_to_ruby_hash json_hash
      JSON.load json_hash
    end
  end
end
