# encoding: utf-8
class OrderMailer < ActionMailer::Base

  default_url_options[:host] = "shikocc.ru"

  default :from => "order@shikocc.ru"

  def order_cofirm(order)
    @order = order
    mail(:to => "maxstbn@yandex.ru", :subject => "Поступил новый заказ на сайте www.shikocc.ru")
  end

  def order_cofirm_user(order)
    @order = order
    mail(:to => @order.email , :subject => "Заказ на сайте www.shikocc.ru")
  end

end