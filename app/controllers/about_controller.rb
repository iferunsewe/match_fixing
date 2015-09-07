class AboutController < ApplicationController
  # before_filter :authenticate_player!

  def index
    render template: "about/index"
  end
end
