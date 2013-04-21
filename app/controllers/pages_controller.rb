class PagesController < ApplicationController

  def index
    @pages = Page.nested_set.all
  end

  def show
    @page = Page.find_by_path(params[:id])
    @metakey = @page.meta_key
    @metadesc = @page.meta_desc
  end

  def save_to_disk
    File.open(Rails.public_path + "/" + @page.title + ".html", "w") do |f|
      f.write(@page.text)
    end
  end
end
