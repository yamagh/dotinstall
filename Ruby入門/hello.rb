=begin
i = 10
i.times do |cnt|
  puts "#{cnt} hello"
end
=end

=begin
i = 0
while i<10 do
  i += 1
  if i%2 == 0
    next
  end
  puts i
end
=end

=begin
for i in 0..10 do
  puts i
end
=end

=begin
for color in ["red", "green", "blue"] do
  puts color
end
=end

=begin
["red", "green", "blue"].each do |color|
  puts color	
end
=end

=begin
{red:100, green:50, blue:20}.each do |color, score|
  puts "#{color}: #{score}"
end
=end

=begin
def foo(name = "bob")
  puts "Hi! #{name}"
end

foo()
=end

=begin
class User

  def initialize(name)
    @name = name
  end

  def sayHi
    puts "Hello, my name is #{@name}"
  end

end

tom = User.new("Tom")
tom.sayHi()
=end

=begin
class User

  @@count = 0

  def initialize(name)
    @name = name
    @@count += 1
  end

  def User.sayHello
    puts "#{@@count} users"
  end

end

User.sayHello()
tom = User.new("tom")
bob = User.new("bob")
User.sayHello()


class SuperUser < User

  def shout
    puts "I am Super User #{@name}"
  end

end


tom = User.new("tom")
bob = SuperUser.new("bob")

bob.shout

=end

class User

  def initialize(name)
    @name = name
  end

  attr_accessor :name

end

tom = User.new("Tom")
puts tom.name
tom.name = "Bob"
puts tom.name
































