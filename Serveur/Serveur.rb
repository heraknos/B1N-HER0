##
# Classe Serveur
#
# Version 1
#
class Serveur

	### Attributs d'instances
	
	# Thread
	# Processus fils d'un serveur
	@thread
	
	### Méthodes de classe
	
	##
	# Constructeur
	#
	def initialize()
		@thread = nil
	end
	
	##
	# Instancie un serveur
	#
	def Serveur.creer()
		new()
	end
	private_class_method :new
	
	### Méthodes d'instances
	
	##
	# Démarre le serveur binhero sur le port spécifié
	#
	# ==== Paramètres
	# * +port+ - (int) Port à écouter
	#
	def demarrer( port, cheminLog )
	
		# Lancement du serveur dans un nouveau processus
		@thread = Thread.new{
			
			# Lancement du serveur
			server = TCPServer.new( port )
			puts "Serveur lance sur le port : #{ port }"
			
			loop do
			
				# Création d'un nouveau thread pour chaque nouvelle connexion entrante
				Thread.start(server.accept) do | client |
					
					# Réception de la requête du client
					str = client.gets()
					requete = Marshal.load( str )
					
					# Traitement de la requête et construction d'une réponse
					puts "IP: #{ client.addr[3] }, cmd: #{ requete.methode }, attr: #{ requete.arguments }"
					reponse = Traitement.instance().send( requete.methode )
					
					# Envoi de la réponse au client
					str = Marshal.dump( reponse )
					client.puts( str )
					
					# Fermeture de la connexion
					client.close()
					
				end
			end
		}
	end
	
	##
	# Arrête le serveur
	#
	def arreter()
		@thread.exit()
	end

end
