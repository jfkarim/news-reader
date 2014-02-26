class FeedsController < ApplicationController
  def index
    @feedds = Feed.includes(:entries)
    
    @feeds = @feeds.to_json(include: :entries).html_safe
    
    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @feeds }
    end
  end
  
  def create
    feed = Feed.find_or_create_by_url(params[:feed][:url])
    feed_json = feed.to_json(include: :entries).html_safe
    
    if feed
      render json: feed_json
    else
      render :json => { error: "invalid url" }, status: :unprocessable_entity
    end
  end
end
