require_relative("../db/sql_runner")
require( 'pry-byebug' )

class Customer

  attr_reader :id
  attr_accessor :name, :funds


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options["name"]
    @funds = options["funds"]
  end

  def save
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds}) RETURNING *"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  
  end

  def films()
    sql = "SELECT films.* from films
    INNER JOIN tickets ON tickets.films_id = films.id
    WHERE customer_id = #{@id}"
    films =  SqlRunner.run(sql)
    result = films.map {|films| Film.new(films)}
    return result
  end

  def self.all()
    sql = "SELECT * FROM customers"
    return self.map_items(sql)
    
  end

  def self.delete_all() 
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end
  

  def self.map_items(sql)
    customer= SqlRunner.run(sql)
    result=customers.map {|customer| CUSTOMER.new(film)}
    return result
  end

# binding pry
# nil
end