class PagesController < ApplicationController

  def home
  end

  def page1
  end

  def page2
  end

  def page3
  end

  def index
    @pages = Page.nested_set.all
  end

  def show
    @page = Page.find_by_path(params[:id])
  end

end
