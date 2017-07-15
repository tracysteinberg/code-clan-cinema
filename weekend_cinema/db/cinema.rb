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
film3 = Film.new({ 'title' => 'San Andreas', 'price' => '12.00'})
film3.save()

ticket1=Ticket.new({'customer_id'=> customer1.id, 'film_id' => film2.id})
ticket1.save()
ticket2=Ticket.new({'customer_id'=> customer2.id, 'film_id' => film2.id})
ticket2.save()
ticket3=Ticket.new({'customer_id'=> customer2.id, 'film_id' => film3.id})
ticket3.save()

# check to see if one visit is true

vistot1 = (ticket1 !=nil &ticket2 = nil &ticket3 = nil) 
vistot2 = (ticket1 = nil &ticket2 !=nil &ticket3 = nil)
vistot3 = (ticket1 = nil &ticket2 = nil &ticket3 != nil)

# show which film customer is booked to see and which customers coming to one film only

visit1=({'customer1' => customer1.name, film2 => '', vistot1=>'' })
visit2=({'customer2' => customer2.name, film2 => '', vistot2=>'' })
visit3=({'customer2' => customer2.name, film3 => '', vistot3=>'' })


binding.pry
nil