require 'ruby_genderize'

describe RubyGenderize::Guesser do
  describe "given a male gender" do
    subject { RubyGenderize::Gender.new gender: "male" }

    specify ".male? returns true" do
      expect(subject.male?).to be_true
    end

    specify ".female? returns false" do
      expect(subject.female?).to be_false
    end

    specify ".unknown? returns false" do
      expect(subject.unknown?).to be_false
    end
  end

  describe "given a female gender" do
    subject { RubyGenderize::Gender.new gender: "female" }

    specify ".male? returns false" do
      expect(subject.male?).to be_false
    end

    specify ".female? returns true" do
      expect(subject.female?).to be_true
    end

    specify ".unknown? returns false" do
      expect(subject.unknown?).to be_false
    end
  end

  describe "given an unknown gender" do
    subject { RubyGenderize::Gender.new }

    specify ".male? returns false" do
      expect(subject.male?).to be_false
    end

    specify ".female? returns false" do
      expect(subject.female?).to be_false
    end

    specify ".unknown? returns true" do
      expect(subject.unknown?).to be_true
    end
  end
end
