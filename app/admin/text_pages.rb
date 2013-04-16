ActiveAdmin.register TextPage do

  belongs_to :page

  controller do

    def create
      @page = Page.find_by_path(params[:id])
      @text_page = @page.text_pages.create(params[:@text_page])
      redirect_to admin_page_path(@page)
    end
  end

end
