require_relative("../db/sql_runner")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i 
    @film_id = options['film_id'].to_i 
  
  end
  
  def save()
    sql = "INSERT INTO tickets (customer_id, film_id)
      VALUES  (#{@customer_id}, #{@film_id})
      RETURNING id"
      ticket = SqlRunner.run(sql).first
      @id = ticket['id'].to_i
    end


  def film()
    sql = "SELECT * FROM film where id = {#@film_id}"
    return FILM.map_items(sql).first
  end

  def customer()
    sql = "SELECT * FROM customer WHERE id = #{@customer_id}"
    customer =  SqlRunner.run(sql)[0]
    return CUSTOMER.new(customer)
  end


  def self.all()
    sql = "SELECT * FROM tickets;"
    tickets = SqlRunner.run(sql)
    result  = tickets.map {|ticket| TICKET.new(visit)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    tickets= SqlRunner.run(sql)
    ticket=tickets.map {|ticket| TICKET.new(location)}
    return result
  end

end