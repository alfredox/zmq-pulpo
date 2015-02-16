require 'em-zeromq'

# version with EM.
zmq = EM::ZeroMQ::Context.new(1)

EM.run {
  pull = zmq.socket(ZMQ::PULL)
  pull.bind("tcp://*:5555")

  pub = zmq.socket(ZMQ::PUB)
  pub.bind("tcp://*:5556")

  pull.on(:message) { |part|
    str = part.copy_out_string
    puts str
    pub.send_msg str
    part.close
  }

}