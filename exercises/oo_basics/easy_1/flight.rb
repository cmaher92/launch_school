class Flight
  # fix is remove the unnecessary getter/setter behavior for the attribute
  # attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number   = flight_number
  end
end

# attr_accessor provides an interface where users can change the value of the
# instance variable @database_handle, which could cause issues with the connecting
# to the wrong database, depending on what the Database class accomplishes. 

# actual
# database_handle is an implementation detail that users most likely wont need
# access to. 
