require 'pg'

class PostgreSql
  def initialize
    @client = PG::Connection.new(host: ENV['POSTGRESQL_HOST'], dbname: 'rand_number', user: ENV['POSTGRESQL_USERNAME'], password: ENV['POSTGRESQL_PASSWORD'])
    @client.query('CREATE TABLE IF NOT EXISTS rand_numbers (id serial PRIMARY KEY, number INTEGER);')
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
    numbers = numbers.map { |n| n['number'].to_i }
    numbers
  end

  private

  def generate_numbers_structure
    600.times do
      @numbers << 4.times.map{ rand(1..9) }.join.to_i
    end
  end

end