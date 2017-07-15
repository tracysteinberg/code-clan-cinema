require_relative( '../models/customer' )
require_relative( '../models/film' )
require_relative( '../models/ticket' )

require( 'pry-byebug' )

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({ 'name' => 'Tracy', 'funds' => 20.00 })
customer1.save()
customer2 = Customer.new({ 'name' => 'Frederick', 'funds' => 50.00 })
customer2.save()

film1 = Film.new({ 'title' => 'Casablanca', 'price' => '8.00'})
film1.save()
film2 = Film.new({ 'title' => 'The Big Sleep', 'price' => '8.00'})
film2.save()
film3 = Film.new({ 'title' => 'San Andreas', 'name' => '12.00'})
film3.save()

ticket1=Ticket.new({'customer_id'=> customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2=Ticket.new({'customer_id'=> customer2.id, 'film_id' => film2.id})
ticket2.save()

binding.pry
nil