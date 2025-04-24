class HomeController < ApplicationController
  def index
    @last_matches = Match.limit(5)
  end
end
