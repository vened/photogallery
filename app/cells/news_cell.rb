class NewsCell < Cell::Rails

  def show
    @news = News.limit(3).order("created_at DESC")
    render
  end

end
