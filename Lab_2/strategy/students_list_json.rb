require_relative 'student_list_strategy'
require 'json'
require 'yaml'

class StudentListJson < StudentListStrategy

  public_class_method :new

  def string_to_list(str)
    JSON.parse(str, {symbolize_names: true})
  end

  def list_to_string(list)
    JSON.generate(list)
  end
end