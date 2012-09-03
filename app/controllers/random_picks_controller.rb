class RandomPicksController < ApplicationController
  def show
    @pick = Pick.random
  end
end
