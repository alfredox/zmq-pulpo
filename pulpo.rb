require 'rubygems'
require 'ffi-rzmq'

context = ZMQ::Context.new(1)

puts "Starting Delivery server..."

# socket to listen for clients
socket = context.socket(ZMQ::PULL)
socket.bind("tcp://*:5555")


publisher = context.socket(ZMQ::PUB)
publisher.bind("tcp://*:5556")

while true do
  # Wait for next request from client
  request = ''
  rc = socket.recv_string(request)

  puts "Received request. Data: #{request.inspect}"

  # Do some 'work'
  puts "Publishes value received:"
  publisher.send_string(request)
  sleep 1

  # Send reply back to client
  socket.send_string("OK")

end