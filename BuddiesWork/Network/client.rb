# Require
require 'socket'

# Ouverture connexion au serveur
socket = TCPSocket.new( 'localhost', 12345 )

# Envoi de donn�es
# socket.print( "Salut c'est toto !" )
# socket.close_write

# Reception de donn�es
response = socket.read
puts response

# while line = socket.gets
	# puts line
# end

# Fermture connexion au serveur
socket.close
