require "open-uri"
require "json"


class GamesController < ApplicationController
  def new
    # arrayy with 10 random letters
    @letters = Array.new(10) { ("A".."Z").to_a.sample }
  end

  def score
  end
end
