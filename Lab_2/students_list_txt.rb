require_relative 'student_list_strategy'
require 'json'

class StudentListTxt < StudentListStrategy
  public_class_method :new

  #Переопределяем методы
  def string_to_list(str)
    to_hash(str.split("\n").map(&:chomp))
  end

  def list_to_string(list)
    to_string(list)
  end

  #делаем приватными методы реализующие перевод из list в string и наоборот
  private

  def to_hash( list_strings)
    list_hashes = []
    list_strings.each do
    |str|
      str = str.gsub('"', "")
      h = {}
      str.split(',').each do |atr|
        key, value = atr.split(':').map(&:strip)
        h[key.to_sym] = value
      end
      list_hashes << h
    end
    list_hashes
  end

  def to_string (hashes)
    str = hashes.map do
    |h|
      h.map{
        |key, value|
        "#{key}: #{value.inspect}"
      }.join(",")
    end
    str.join("\n")
  end
end