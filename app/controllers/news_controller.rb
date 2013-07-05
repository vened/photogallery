class NewsController < ApplicationController

  def index
    @news_all = News.all
    @meta_title = "Новости"
  end

  def show
    @news = News.find_by_path(params[:id])
    @photos = @news.photos
    @meta_title = @news.title
  end


end
