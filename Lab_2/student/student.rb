require 'json'
require_relative 'student_short'
class Student < StudentShort

  # создаем методы чтения и записи attr_accessor
  attr_accessor :id
  attr_reader :last_name, :first_name, :paternal_name, :phone, :git, :telegram, :email

  #валидатор телефона
  def self.valid_phone?(phone)
    phone.match(/^\+?[7,8] ?\(?\d{3}\)?-?\d{3}-?\d{2}-?\d{2}$/)
  end

  #валидатор для фамилии имени и отчества
  def self.valid_name?(name)
    name.match(/^[А-Я][а-я]+$/)
  end

  #валидатор для git и telegram
  def self.valid_account?(account)
    account.match(/^@[A-Za-z0-9\-_]+$/)
  end

  #валидатор почты
  def self.valid_email?(email)
    email.match(/^[A-Za-z0-9\-_]+@[A-Za-z]+\.([A-Za-z]+\.)*[A-Za-z]+$/)
  end

  # конструктор
  def initialize(last_name:nil, first_name:nil, paternal_name:nil, id:nil, phone:nil, git:nil, telegram:nil, email:nil)
    raise ArgumentError, "Required fields: last_name, first_name and paternal_name!" if last_name.nil?|| first_name.nil? || paternal_name.nil?
    self.last_name = last_name
    self.first_name = first_name
    self.paternal_name = paternal_name
    self.id = id
    self.git = git
    self.set_contacts(phone:phone, telegram:telegram, email:email)
  end
  def self.into_hash(hash)
    Student.new(**hash)
  end
  def self.pars_str(str)
    args = JSON.parse(str)
    raise ArgumentError,"The argument must have last_name, first_name and paternal_name" unless
      (args.has_key?('last_name') and args.has_key?('first_name') and args.has_key?('paternal_name'))

    new(last_name: args['last_name'],
        first_name: args['first_name'],
        paternal_name: args['paternal_name'],
        id: args['id'],
        phone: args['phone'],
        git: args['git'],
        telegram: args['telegram'],
        email: args['email'])
  end

  #(last_name, first_name, paternal_name, id:nil, phone:nil, git:nil, telegram:nil, email:nil)
  def shortName
    "#{last_name} #{first_name[0]}. #{paternal_name[0]}."
  end

  def contact
    return @contact = {phone: phone} unless phone.nil?
    return @contact = {telegram: telegram} unless telegram.nil?
    return @contact = {email: email} unless email.nil?
    nil
  end

  def getInfo
    raise ArgumentError, "Required fields: last_name, first_name and paternal_name!" if last_name.nil?|| first_name.nil? || paternal_name.nil?
    info = "#{shortName}"
    info += " #{getContact}"  unless getContact.nil?
    info += " git= #{git}" unless git.nil?
    info
  end

  def to_hash
    attrs = {}

    %i[first_name last_name paternal_name id phone telegram email git].each do |attr|
      attr_val = send(attr)
      attrs[attr] = attr_val unless attr_val.nil?
      end
    attrs
  end

  #сеттер
  def phone=(phone)
    raise ArgumentError, "Incorrect value: phone=#{phone}!" if !phone.nil? && !Student.valid_phone?(phone)
    @phone = phone
  end


  def first_name=(first_name)
    raise ArgumentError, "Incorrect value: first_name=#{first_name}!" if !first_name.nil? && !Student.valid_name?(first_name)

    @first_name = first_name
  end


  def last_name=(last_name)
    raise ArgumentError, "Incorrect value: last_name=#{last_name}!" if !last_name.nil? && !Student.valid_name?(last_name)

    @last_name = last_name
  end


  def paternal_name=(paternal_name)
    raise ArgumentError, "Incorrect value: paternal_name=#{paternal_name}!" if !paternal_name.nil? && !Student.valid_name?(paternal_name)

    @paternal_name = paternal_name
  end

  def git=(git)
    raise ArgumentError, "Incorrect value: git=#{git}!" if !git.nil? && !Student.valid_account?(git)

    @git = git
  end

  def telegram=(telegram)
    raise ArgumentError, "Incorrect value: telegram=#{telegram}!" if !telegram.nil? && !Student.valid_account?(telegram)

    @telegram = telegram
  end

  def email=(email)
    raise ArgumentError, "Incorrect value: email=#{email}!" if !email.nil? && !Student.valid_email?(email)

    @email = email
  end

  def validate?
    !git.nil? && !email.nil? && !telegram.nil? && !phone.nil?
  end

  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone if phone
    self.email = email if email
    self.telegram = telegram if telegram
    @contact = contact
  end


  def to_s
    res = self.last_name + " " + self.first_name + " " + self.paternal_name
    res+=" id: #{self.id}" unless self.id.nil?
    res+=" phone: #{self.phone}" unless self.phone.nil?
    res+=" git: #{self.git}" unless self.git.nil?
    res+=" telegram: #{self.telegram}" unless self.telegram.nil?
    res+=" email: #{self.email}" unless self.email.nil?
    res
  end
end# frozen_string_literal: true

