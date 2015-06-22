require 'spec_helper'

describe ArabicToEnglish do 
  let(:conversion) { ArabicToEnglish.new }

  describe "ArabicToEnglish object" do
    it "it should be an instance of ArabicToEnglish" do 
      expect(conversion).to be_a ArabicToEnglish
    end
  end

  describe "Checks the base value intialized or not" do
    it "it should return the hash value" do
      expect(conversion.numbers_to_name.class).to eq Hash
    end
  end

  describe "#Checks the zero" do
    it "it should return zero in string" do  
      conversion.get_word(0)    
      expect(conversion.result.join(' ')).to eq "zero"
    end
  end

  describe "#Checks other single digit input" do
    it "it should return five in string" do
      conversion.get_word(5)
      expect(conversion.result.join(' ')).to eq "five"
    end
  end

  describe "#Checks double digit input in tens" do
    it "it should return eighty nine in string" do   
      conversion.get_word(89)   
      expect(conversion.result.join(' ')).to eq "eighty nine"
    end
  end

  describe "#Checks three digit input in hundreds" do
    it "it should return one hundred eighty in string" do
      conversion.get_word(180)     
      expect(conversion.result.join(' ')).to eq "one hundred eighty"
    end
  end

  describe "#Check four digit input in thousands" do
    it "it should return thousand eight hundred in string" do
      conversion.get_word(1800)
      expect(conversion.result.join(' ')).to eq "thousand eight hundred"
    end
  end

  describe "#Check five digit input in ten thousands" do
    it "it should return ninety nine thousand nine hundred ninety nine  in string" do     
      conversion.get_word(99999)
      expect(conversion.result.join(' ')).to eq "ninety nine thousand nine hundred ninety nine"
    end
  end

  describe "#Check six digit input in hundred thousands" do
    it "it should return  four hundred fifty six thousand seven hundred sixty five in string" do      
      conversion.get_word(456765)
      expect(conversion.result.join(' ')).to eq "four hundred fifty six thousand seven hundred sixty five"
    end
  end

  describe "#Check seven digit input in million" do
    it "it should return 'five million, four hundred thirty two thousand, one hundred sixty-seven' in string" do      
      conversion.get_word(5432167)
      expect(conversion.result.join(' ')).to eq "five million four hundred thirty two thousand one hundred sixty seven"
    end
  end

  describe "#Check eight digit input million in tens" do
    it "it should return 'fifteen million four hundred thirty two thousand one hundred sixty seven' in string" do  
      conversion.get_word(15432167)    
      expect(conversion.result.join(' ')).to eq "fifteen million four hundred thirty two thousand one hundred sixty seven"
    end
  end

  describe "#Check nine digit input million in hundreds" do
    it "it should return 'nine hundred eighty seven million six hundred fifty four thousand three hundred thirty two' in string" do   
      conversion.get_word(987654332)   
      expect(conversion.result.join(' ')).to eq "nine hundred eighty seven million six hundred fifty four thousand three hundred thirty two"
    end
  end

  describe "#Check input should be an integer" do
    it "it should return error message to the user" do      
      expect(@conversion.get_word("test").join(' ')).to eq "Invalid Input - Please enter the number form 0 to 999999999"
    end
  end
end