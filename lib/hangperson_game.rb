class HangpersonGame

  attr_reader :word, :guesses, :wrong_guesses
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  def guess(letter)
    letter = letter.to_s.downcase
    return :invalid unless letter.match (/[a-z]{1}/)
    word.include?(letter) ? correct_guess(letter) : wrong_guess(letter)
  end

  def word_with_guesses
    word.gsub(/[^"#{guesses}"]/, '-')
  end

  def check_win_or_lose
    return :lose if wrong_guesses.size > 6
    return :win if word_with_guesses == word
    :play
  end

  # Get a word from remote "random word" service.
  # You can test it by running $ bundle exec irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> HangpersonGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start { |http|
      return http.post(uri, "").body
    }
  end

  private

  def correct_guess(letter)
    guesses.include?(letter) ? false : guesses << letter
  end

  def wrong_guess(letter)
    wrong_guesses.include?(letter) ? false : wrong_guesses << letter
  end
end
