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

end
