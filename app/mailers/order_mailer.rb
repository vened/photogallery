# encoding: utf-8
class OrderMailer < ActionMailer::Base

  default_url_options[:host] = "shikocc.ru"

  default :from => "maxstbn@gmail.com"

  def order_cofirm(order)
    @order = order
    mail(:to => "maxstbn@gmail.com, maxstbn@yandex.ru", :subject => "На промосайте кандид.рф, появился новый вопрос.")
  end

  def reply_query(feedback)
    @feedback = feedback
    mail(:to => feedback.email, :subject => "На сайте кандид.рф получен ответ на ваш вопрос.")
  end

end