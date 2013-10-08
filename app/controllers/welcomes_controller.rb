class WelcomesController < ApplicationController
  def index
    @album = Chute::V2::Albums.all.data[0]

    @assets = Chute::V2::Assets.all(@album.id)
  end
end
