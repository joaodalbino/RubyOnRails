#####
#logic tricks:
	#if n == 0? 1 : n * factorial(n-1) ## if n = 0 then return 1, otherwise returns n * factorial(n-1)
	#3.times #thing - It does 3 times a thing.


#####
#Basic Flow Controls:
#If examples:
		a= 4
		if a==3
			puts "ouna"
			elseif a==4	
				puts "found the chick"	
			else
			puts "fuck no data"
		end
	#oneline
		b=2
		puts "one liner" if b==5
	#searching for something equal
		if /sera/ === "coursera"
			puts "triple equals"	#=> triple equals
		end
	#using variable types
		if Integer === 8
			puts "yes" 				#=> yes
		end
#unless examples:
		a = 5
		unless a==6
			puts "a not 6"
		end
#while examples:
		a = 10
		while a > 9
			puts a
			a -= 1
		end
	#one line
		a *= 2 while times_2 < 100
			puts times_2 # => 128
		end 

#until examples:
		a = 9 
		until >= #x
			#thingstdo
		end

#case examples:
		age = 21
		case
			when age >= 21
          		puts "drink"
      		when 1 == 0
        		puts "written by a drunk programmer"
			else
          		puts "default condition"
		end

#for examples:
		for i in 0..2
			puts i
		end

#method examples:
		def simple
			puts "no pares"
		end
	#using parameters
		def divide(one, two)
       		return "I don't think so" if two == 0
       		one / two
		end
	#using parameters2
		def can_div(number)
     		return false if number.zero?
     		true
		end
		#it returns true if not zero and zero if number = 0
	#factorial
		def factorial (n)
     		n == 0? 1 : n * factorial(n-1);
		end
		# if n = 0 then return 1, otherwise returns n * factorial(n-1)

#blocks examples:
#when one line, uses {}
#when multiples lines, uses "do" and "end"
		2.times do |index|
     		if index > 0
        		puts index
     		end
		end
		#=>1
	#one line
		2.times { |index| puts index if index > 0}
	#the next method refers to coding above it
		def two_times
    		return "no block" unless block_given?
    		yield
    		yield
		end
		puts two_times {prints "hello"} 
		#in this case, it will print 2 times hello
		#if not {prints "hello"} then it'd print no block

#files examples:
#something good about ruby is that file is automatically closed at the end of the block;
	#open and writing files
		File.open ("test1.txt", "w") do |file|
     		file.puts "One line"
     		file.puts "Another"
		end
	#reading files
		File.foreach ( 'test.txt' ) do |line|
    		puts line
    		p line
    		p line.chomp
    		p line.split
		end
		#being txt: eu sei / tu sabes / ele sabe, it gives something like:
		#eu sei
		#eu sei/n - chops off newline character
		#{}"eu" "sei"
		#tu sabes
		#...
		#if the text doesn't exist, ruby gives exception message
		#but you can rescue the exception using:
		rescue Exception => e
     		puts e.message
     		puts "let's pretend this didn't happen..."
		end

	#simple way	
		if File.exist? 'test.txt'
     		File.foreach ('test.txt') do |line|
        		puts line.chomp
     		end
		end
#strings possibilities:
#\n - chomps
#\t - tabs
		myname = "joao"
		puts myname.lstrip.capitalize #=>Joao

		p myname #=> "joao"

	#changing letters
		myname[0] = "t"
		puts myname #=> toao
		
	#changin words
		bigstring = %Q{Call me when}
		bigstring.lines do |line|
     		line.sub! 'Call', 'ball'
     		puts "#{line.strip}" #=> ball me when
		end

#array examples:
		m = ["1", 2, :three];
		puts m[1] #=> 2

	#selecting words from the ending
		a = %w{ what a great day today! }
		puts a[-2] #=> day
	#selecting from the ending and taking two words
		puts a[-3, 2] #=> great day
	#sorting
		n = [1,4,2,3]
		n.sort!
		puts n #=> [1,2,3,4]
	#selecting numbers higher then 2
		new = a.select { |num| num > 2}
		p new  #=> 3,4
#ranges examples:
		1..10 #every number since 1 to 10

		1...10 #every number since 1 to 9
	#checking
		rg = 1..10
		rg.include? 2 #=> true
	#another case of checking
		'a'...'z' === "z"
		false
	#using ranges in case
		age  = 12
		case age
			when 1..12 
 				puts "kid"
			when 13..14
 				puts "teenager"
			else
				puts "adult"
		end 
		#=>kid
#hashes examples:
		e = {"font" => "Arial", "size" => 12}
		puts e["font"] #=> Arial
		e["color"] = "Blue"
		e.each_pair do |key, value"|
			puts "Key: #{key} value: #{value}" 
				#=> Key: font value: Arial
				#=> Key: size value: 12...
	#another way of hashes
		f = {f:"John", m:"kjo", n:"non"}
#classes
#instance variables begin with @
#creating a class: new causes initialize
	class Person
		def initialize (name, age) # constructor
			@name = name
			@age = age
		end
		def get_info
			@additional_info = "Interesting"
			"Name: #{@name}, age: #{@age}"
		end
	end
	person1 = Person.new("Joe", 14)
	p person1.instance_variables # you can see what person[:@name, :@age]
	puts person1.get_info # => name: joe, age: 14
	p person1.instance_variables # [:@name, :@age, :@additional_info]
#to get the info from data you gotta have set and get
	class Person
		def initialize (name, age) # constructor
			@name = name
			@age = age
		end
		def name
			@name
		end
		def name (new_name)
			@name = new_name
		end
	end
	person1 = Person.new("Joe", 14)
	puts person1.name #joe
	person1.name = "Mike"
	puts person1.name #Mike
	# it will warn about the age: undefined method 'age' for #<Person
#acessing data (another way)
	class Person
		attr_acessor :name, :age # getters and setters for name and age
	end
	person1 = Person.new
	p person1.name # => nil
	person1.name = "Mike"
	person1.age = 15
	puts person1.name # Mike
	puts person1.age # => 15
	person1.age = "fifteen"
	puts person1.age # => fifteen
#acessing data (another way) - using self: refers to the object itself
	class Person
		attr_reader :age
		attr_acessor :name

		def initialize (name, ageVar)
			@name = name
			self.age = ageVar # it's calling the age = method ---- why self? cause it's making self as method, so a public variable
			puts age #calls the reader
		end

		def age= (new_age)
			@age || = 5 # default 
			@age = new_age unless new_age > 120
		end

		person1 = Person.new("Kim", 130) # 13
		puts "My age is #{person1.age}" # my age is 5 (the setter didn't allow the change and the default will be used)
		person1.age = 10 # try to change the age
		puts person1.age # =>10 
		person1.age = 130
		puts person1.age # 10 (still)
#class methods and variables
	class MathFunctions
		def self.double(var) # method - 1. Using self
			times_called; var *2;
		end
		class << self # 2.using <<self
			def times_called
				@@times_called || = 0; @@times_called += 1
			end
		end
	end
	def MathFunctions.triple(var)
		times_called; var * 3
	end
	# No instance created
	puts MathFunctions.double 5 # => 10 (calling the class itself)
	puts MathFunctions.triple(3) # => 9
	puts MathFunctions.times_called # => 3

# class inheritance -  use mixins, not multiple inharitance
	class Dog
		def to_s
			"Dog"
		end
		def bark
			"barks loudly"
		end
	end
	class SmallDog < Dog
		def bark # override
			"Barks quietly"
		end
	end
	dog = Dog.new # new is class method
	small_dog = SmallDog.new
	puts "#{dog}1 #{dog.bark}" #=> Dog1 barks loudly
	puts "#{small_dog}2 #{small_dog.bark}" # => Dog2 barks quietly
#modules
	module Sports
		class Match
			attr_acessor :score
		end
	end
	module Patterns
		class Match
			attr_acessor :complete
		end
	end

	match1 = Sports::Match.new
	match1.score = 45; puts match1.score # => 45
	match2 = Patterns::Match.new
	match2.complete = true; puts match2.complete #=>true

#modules and mixin
	module SayMyName
		attr_acessor :name
		def print_name
			puts "Name: #{@name}"
		end
	end
	class Person
		include SayMyName
	end
	class Company
		include SayMyName
	end

	person = Person.new
	person.name = "Joe"
	person.print_name # name: Joe
	company = Company.new
	company.name = "Google & Microsoft LLC"
	company.print_name # => name:  Google & Microsoft LLC



# CLASS - MIXIN - MAIN
	# name of file - player.rb
	class Player 
		attr_reader :name, :age, :skill_level
		def initialize (name, age, skill_level)
			@name = name
			@age = age
			@skill_level = skill_level
		end
		def to_s
			"<#{name}: #{skill_level}(SL), #{age}(AGE)>"
		end
	end
	# team.rb
	class Team
		include Enumerable #lots of functionality
		attr_acessor :name, :players
		def initialize (name)
			@name = name
			@players = []
		end
		def add_players (*players) #splat
			@players += players
		end
		def to_s
			"#{@name} team: #{@players.join(", ")}"
		end
		def each 
			@players.each { |player| yield player}
		end
	end
	#MAIN
	require_relative 'player'
	require_relative 'team' # imports team.rb

	player1 = Player.new("Bob", 13, 5); player2 = Player.new("Jim", 15, 4.5)
	player3 = Player.new("Mike", 21,5)
	red_team = Team.new("Red")
	red_team.add_players(player1, player2, player3)
	#select only players between 14 and 21 and reject any player below 4.5
	elig_players = red_team.select {|player| (14...21) === player.age}
						   .reject {|player| player.skill_level < 4.5}
	puts elig_players # => <Jim: 4.5(SL), 15(AGE)> and  the others

#scope
	v1 = "outside"
	class MyClass
		def my_method
			# p v1 exception thrown no such variable exists
			v1 = "inside"
			p v1
			p local_variables
		end
	end
	p v1 # =>outside
	obj = MyClass.new
	obj.my_method # =>inside // => [:v1]
	p local_variables #=> [:v1, :obj]
	p self # => main
#acess control: how the wold sees the class (public, protected and private)	
	class MyAlgorithm
		private
			def test1
				"Private"
			end
		protected
			def test2
				"Protected"
			end
		public
			def public_again
				"Public"
			end
	end
	#another way of acess control
	class Another
		def test1
			"Private, as declared later on"
		end
		private :test1
	end
#a exception for private you call self method
#






