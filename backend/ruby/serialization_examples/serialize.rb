
require 'json'

  class Person
    attr_accessor :name, :age, :gender

    def initialize(name, age, gender)
      @name = name
      @age = age
      @gender = gender
    end
  # to_yaml method: making a Ruby hash and turning it into a YAML string using modules provided by the standard library
    def to_yaml
      YAML.dump ({
        :name => @name,
        :age => @age,
        :gender => @gender
      })
    end
    # from_yaml: take the string, convert it into a Ruby hash, then use the contents of our hash with the constructor to construct a new instance of Person.  
    def self.from_yaml(string)
      data = YAML.load string
      p data
      self.new(data[:name], data[:age], data[:gender])
    end

    
    # literally the same, except for the use of JSON, instead of YAML
    def to_json
        JSON.dump ({
        :name => @name,
        :age => @age,
        :gender => @gender
        })
    end

    def self.from_json(string)
        data = JSON.load string
        self.new(data['name'], data['age'], data['gender'])
    end
  end

  p = Person.new "David", 28, "male"
  p p.to_yaml

  p = Person.from_yaml(p.to_yaml)
  puts "Name #{p.name}"
  puts "Age #{p.age}"
  puts "Gender #{p.gender}"
