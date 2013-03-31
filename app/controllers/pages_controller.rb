class PagesController < ApplicationController

  include TheSortableTreeController::Rebuild

  def index
    @pages = Page.nested_set.all
  end

  def show
    @page = Page.find_by_path(params[:id])
 end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find_by_path(params[:id])
  end

  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url }
    end
  end
end
