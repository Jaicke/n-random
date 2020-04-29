require 'mongo'

class MongoDb

  def initialize
    @client = Mongo::Client.new(ENV['MONGO_DB_URI'], database: ENV['MONGO_DB_DATABASE'])
    @numbers = []
  end

  def add_random_numbers
    generate_numbers_structure
    @client[:rand_number].insert_many(@numbers)
    @client.close
  end

  def get_random_numbers
    numbers = @client[:rand_number].find.to_a
    numbers = numbers.map { |n| n['number'] }
    @client.close
    numbers
  end


  private

  def generate_numbers_structure
    600.times do
      @numbers << { number: 4.times.map{ rand(1..9) }.join.to_i }
    end
  end

end