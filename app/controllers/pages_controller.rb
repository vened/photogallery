class PagesController < ApplicationController

  def index
    @pages = Page.nested_set.all
  end

  def show
    @page = Page.find_by_path(params[:id])
    @metakey = @page.meta_key
    @metadesc = @page.meta_desc

    begin
      @rendered = Haml::Engine.new(@page.text).render
    rescue Haml::SyntaxError
      @rendered = Haml::Engine.new(@page.text.gsub(/\s{2,}/, '')).render
    end
  end
end
