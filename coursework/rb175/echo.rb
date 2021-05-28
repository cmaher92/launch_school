require "socket"
require "pry"

def parse_params(params)
	binding.pry
end

def parse(request_line)
	# split into a dictionary
	# { method: "", path: "", params: {}, protocol: ""}
	request = {}
	request[:method], request_path, request[:protocol] = request_line.split(" ")

	if request_path.include?("?")
		request[:path], request[:params] = request_path.split("?")
		request[:params] = parse_params(request[:params])
	else
		request[:path] = request_path
	end

	request
end



server = TCPServer.new("localhost", 3003) # creates a new server socket bound to hostname/port
loop do
	client = server.accept # accepts incoming connection, returns TCPSocket object

	request_line = client.gets # Uses parent class IO#gets to read from socket
	request = parse(request_line)

	client.puts "HTTP/1.1 200 OK"
	client.puts "Content-Type: text/plain"
	client.puts "" # need a blank link between body and headers
	

	client.close # IO#close; closes stream
end
