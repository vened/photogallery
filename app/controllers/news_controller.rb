class NewsController < ApplicationController

  def index
    @news_all = News.all
  end

  def show
    @news = News.find(params[:id])
    @photos = @news.photos
  end


end
