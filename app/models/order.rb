# encoding: utf-8
class Order < ActiveRecord::Base

  attr_accessible :username, :surname, :email, :phone, :address, :date, :first_time, :last_time, :comment, :data, :price

  attr_reader :items

  validates_length_of :username, :in => 2..50, :message => "Имя должно быть длинной не менее 2 и не более 50 символов"
  validates :email, :format => { :with => /[A-Za-z0-9._%+-]+@([A-Za-z0-9-]+\.)+([A-Za-z0-9]{2,4}|museum)/, :message => "Не правильно указан адрес e-mail" }
  validates_length_of :phone, :in => 9..15, :message => "Не указан телефон"
  validates_length_of :address, :in => 5..300, :message => "Не указан адрес"
  validates_length_of :date, :in => 5..300, :message => "Не указана дата доставки"
  validates_length_of :first_time, :in => 2..100, :message => "Не указано время от"
  validates_length_of :last_time, :in => 2..100, :message => "Не указано время до"


end
