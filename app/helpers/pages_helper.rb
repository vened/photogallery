# encoding: utf-8
module PagesHelper

  def metakey
    base_meta_key = "кейтеринг, выездной фуршет, фуршет"
    if @metakey.nil?
      base_meta_key
    else
      @metakey
    end
  end

  def metadesc
    base_meta_desc = "Высококачественные услуги в области выездного ресторанного бизнеса"
    if @metadesc.nil?
      base_meta_desc
    else
      @metadesc
    end
  end

  #закомментил Стасову сохранялку на диск
  #def render_page
  #  begin
  #    @rendered = Haml::Engine.new(@page.text).render
  #  rescue Haml::SyntaxError
  #    @rendered = Haml::Engine.new(@page.text.gsub(/\s{2,}/, '')).render
  #  end
  #end
end
