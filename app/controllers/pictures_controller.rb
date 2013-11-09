class PicturesController < ApplicationController

  def create
    @picture = Picture.create(params[:pic])
    render json: @picture
  end

end
