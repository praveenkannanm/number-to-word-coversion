class ArabicToEnglish
  attr_accessor :numbers_to_name, :result
  def initialize
    @numbers_to_name = {
          1000000 => "million",
          1000 => "thousand",
          100 => "hundred",
          90 => "ninety",
          80 => "eighty",
          70 => "seventy",
          60 => "sixty",
          50 => "fifty",
          40 => "forty",
          30 => "thirty",
          20 => "twenty",
          19 => "nineteen",
          18 => "eighteen",
          17 => "seventeen", 
          16 => "sixteen",
          15 => "fifteen",
          14 => "fourteen",
          13 => "thirteen",              
          12 => "twelve",
          11 => "eleven",
          10 => "ten",
          9 => "nine",
          8 => "eight",
          7 => "seven",
          6 => "six",
          5 => "five",
          4 => "four",
          3 => "three",
          2 => "two",
          1 => "one",
          0 => "zero"
        }
    @result = []
  end


  def get_word(value)
    case
    when (0..9).include?(value)
      result << numbers_to_name[value]
    when (10..99).include?(value)
      process_10s(value)
    when (100..999).include?(value)
      process_100s(value)
    when (1000..999999).include?(value)
      process_1000s(value)
    end
  end

  # Method for process value from 10 to 99
  def process_10s(value)
    if( (value % 10) == 0 || value <= 20)
      @result << @numbers_to_name[value]
    else
      tens = value % 10
      @result  << @numbers_to_name[value - tens]
      @result << @numbers_to_name[tens]
    end
  end

  # Method for process value from 100 to 999
  def process_100s(value)
    @result << @numbers_to_name[(value / 100)]
    @result << @numbers_to_name[100]
    return @result if (value % 100) == 0
    get_word(value % 100)
  end

  # Meathod for process value from 1000 to 999999
  def process_1000s(value)
    get_word((value / 1000))
    @result << @numbers_to_name[1000]
    return @result if (value % 1000) == 0
    get_word(value % 1000)
  end
end

value = ARGV[0].to_i
int_to_word_conversion  = ArabicToEnglish.new
int_to_word_conversion.get_word(value)
puts int_to_word_conversion.result

