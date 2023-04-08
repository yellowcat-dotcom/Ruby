require 'json'
#(last_name, first_name, paternal_name, id:nil, phone:nil, git:nil, telegram:nil, email:nil)
class StudentShort

  attr_reader :id, :git, :contact, :initials

  def initialize(student)
    @id = student.id
    @initials = "#{student.last_name} #{student.first_name[0]}.#{student.paternal_name[0]}. "
    @git = student.git unless student.git.nil?
    @contact = student.set_contacts(phone: student.phone, email: student.email, telegram: student.telegram)
  end

  def self.from_str(id, str)
    result = JSON.parse(str)
    raise ArgumentError, 'Missing fields: last_name, first_name, paternal_name' unless result.key?('first_name') &&
      result.key?('last_name') && result.key?('paternal_name')

    StudentShort.new(Student.new(last_name: result['last_name'],first_name: result['first_name'],
                                 paternal_name: result['paternal_name'],id: id,
                                 phone: result['phone'], git: result['git'],
                                 email: result['email'],telegram: result['telegram']))
  end

  def shortName
    "#{@initials}"
  end
  def to_s
    res = "#{initials}"
    res += "id=#{id}" unless id.nil?
    res += " git=#{git}" unless git.nil?
    res += " #{contact}" unless contact.nil?
    res
  end
end