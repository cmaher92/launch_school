# implement a shift operator to make the following code work

class Network
  def initialize(name)
    @name = name
    @tickets = []
  end
  
  def tickets
    @tickets.map { |ticket| ticket.title }.join(', ')
  end
  
  # answer
  def <<(ticket)
      @tickets << ticket
  end
end

class Ticket
  attr_reader :title
  def initialize(t, d)
    @title = t
    @description = d
  end
end

nipr = Network.new('NIPR')

ticket = Ticket.new('user account not working', 'user is having issue with user account')

nipr << ticket
puts nipr.tickets