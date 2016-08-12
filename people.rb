class Person
  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hi, my name is #{@name}"
  end

end

class Student < Person
  def learn
    puts "I get it!"
  end
end

class Instructor < Person
  def teach
    puts "Everything in Ruby is an Object"
  end
end

ic = Instructor.new("Chris")

ic.greeting
ic.teach

sc = Student.new("Christina")

sc.greeting
sc.learn
# sc.teach = NoMethodError because the teach method is an instance method for
# the Instructor class, not the Student class
