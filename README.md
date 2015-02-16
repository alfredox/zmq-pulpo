PULPO ZMQ
=========

The names comes from Pull-pub pattern in ZMQ.

This is a server that creates a PULL socket in order to receive messages, and creates a PUB in order to broadcast those
messages to connectect subscribers.

Useful for a Rails app that should send messages to many different clients, because the creation of the PUSH sockets is very lightweight (? verify).

/Alfredo