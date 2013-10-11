class WelcomesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]

  def index
    @album = Chute::V2::Albums.all.data[0]

    @assets = Chute::V2::Assets.all(@album.id)
  end

  def new
  end

  def create
    album = Chute::V2::Albums.all.data[0]
    Chute::V2::Assets.upload(album.id, params[:video][:video])

    redirect_to welcomes_path
  end

  def show
    @asset = Chute::V2::Assets.find(params[:id])
  end
end
