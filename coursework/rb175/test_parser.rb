def parse_request_line(request_line)
  http_method, path = request_line.split(' ')
  params = {}
  
  path, query_str = path.split('?')
  
  if query_str
    query_str = query_str.split('&')
    query_str.each do |pair|
      key, value = pair.split('=')
      params[key] = value
    end
  end

  [http_method, path, params]
end

p parse_request_line("GET /?rolls=2&sides=6 HTTP/1.1")
p parse_request_line("GET /?rolls=2 HTTP/1.1")
p parse_request_line("GET / HTTP/1.1")