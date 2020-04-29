require 'tiny_tds'

class SqlServer
	def initialize
    @client = TinyTds::Client.new(username: ENV['SQLSERVER_USERNAME'], password: ENV['SQLSERVER_PASSWORD'], host: ENV['SQLSERVER_HOST'], database: "rand_number")
    q = @client.execute("IF OBJECT_ID(N'dbo.rand_numbers', N'U') IS NULL BEGIN CREATE TABLE dbo.rand_numbers (number int not null); END;")
    q.cancel
    @numbers = []
  end

  def add_random_numbers
    generate_numbers_structure
    @numbers.each do |number|
      @client.execute("INSERT INTO rand_numbers (number) VALUES (#{number});")
    end
  end

  def get_random_numbers
    numbers = @client.execute("SELECT number FROM rand_numbers;").to_a
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