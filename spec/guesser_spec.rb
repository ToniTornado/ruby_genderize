require 'ruby_genderize'

describe RubyGenderize::Guesser do
  describe "given the female first name 'Julia'" do
    before :each do
      RubyGenderize::Guesser.stub_chain(:open, :read).and_return("{\"name\":\"Julia\",\"gender\":\"female\",\"probability\":\"1.00\",\"count\":37}")
    end

    let(:first_name) { "Julia" }

    it "#guess_gender returns the string 'female'" do
      result = RubyGenderize::Guesser.guess_gender first_name
      expect(result).to eq 'female'
    end

    it "#female? returns true" do
      result = RubyGenderize::Guesser.female? first_name
      expect(result).to be_true
    end

    it "#male? returns false" do
      result = RubyGenderize::Guesser.male? first_name
      expect(result).to be_false
    end
  end

  describe "given the male first name 'Peter'" do
    before :each do
      RubyGenderize::Guesser.stub_chain(:open, :read).and_return("{\"name\":\"Peter\",\"gender\":\"male\",\"probability\":\"1.00\",\"count\":99}")
    end

    let(:first_name) { "Peter" }

    it "#guess_gender returns the string 'male'" do
      result = RubyGenderize::Guesser.guess_gender first_name
      expect(result).to eq 'male'
    end

    it "#male? returns true" do
      result = RubyGenderize::Guesser.male? first_name
      expect(result).to be_true
    end

    it "#female? returns false" do
      result = RubyGenderize::Guesser.female? first_name
      expect(result).to be_false
    end
  end  
end
