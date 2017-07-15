require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price 

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price']
  end

    def customers()
      sql = "SELECT customers.* from customers
      INNER JOIN tickets ON tickets.customer_id = customers.id
      WHERE film_id = #{@id}"
      customers =  SqlRunner.run(sql)
      result = customers.map {|customer| CUSTOMER.new(customer)}
      return result
    end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{ @title }', '#{ @price }') RETURNING id"
    film = SqlRunner.run( sql ).first
    @id = film['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM films"
    return self.map_items(sql)
    
  end

  def self.delete_all() 
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    films = SqlRunner.run(sql)
    result=films.map {|film| FILM.new(film)}
    return result

  end

end