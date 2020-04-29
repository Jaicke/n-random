require 'mysql2'

class MySql

  def initialize
    @client = Mysql2::Client.new(host: ENV['MYSQL_HOST'], username: ENV['MYSQL_USERNAME'], database: "rand_number", password: ENV['MYSQL_PASSWORD'])
    @client.query('CREATE TABLE IF NOT EXISTS rand_numbers (id serial PRIMARY KEY, number INT);')
    @numbers = []
  end

  def add_random_numbers
    generate_numbers_structure
    @numbers.each do |number|
      @client.query("INSERT INTO rand_numbers (number) VALUES (#{number});")
    end
  end

  def get_random_numbers
    numbers = @client.query("SELECT number FROM rand_numbers;").to_a
    numbers = numbers.map { |n| n['number'] }
    numbers
  end

  private

  def generate_numbers_structure
    600.times do
      @numbers << 4.times.map{ rand(1..9) }.join.to_i
    end
  end

end