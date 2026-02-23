require "open-uri"
require "json"


class GamesController < ApplicationController
  def new
    # arrayy with 10 random letters
    @letters = Array.new(10) { ("A".."Z").to_a.sample }
  end

  def score
    @word = params[:word].upcase
    # string to array now
    @letters = params[:letters].split

    # first check: did user only take letters from letter grid?
    word_in_grid = @word.chars.all? { |letter| @word.count(letter) <= @letters.count(letter) }

    # 2nd check for real englisch word
    response = URI.open("https://dictionary.lewagon.com/#{@word}")
    json = JSON.parse(response.read)
    english_word = json["found"]

    # urteil/judgement
    if !word_in_grid
      @result = "Sorry but <b>#{@word}</b> can't be built out of #{@letters.join(', ')}, bro! 🙈"
    elsif !english_word
      @result = "Sorry but <b>#{@word}</b> does not seem to be a valid English word, bro... You should learn english first! 🤪🚀"
    else
      @result = "Congratulations! <b>#{@word}</b> is a valid English word, bro 🍾🎉!"
    end
  end
end
