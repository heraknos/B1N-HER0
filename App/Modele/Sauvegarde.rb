##
# Classe Sauvegarde
#
# Version 8
#
class Sauvegarde

	### Attributs d'instances
	
	# int
	# Identifiant locale de la sauvegarde
	@id

	# int
	# Identifiant universel unique de la sauvegarde
	@uuid
	
	# int
	# Version de l'entitée
	@version

	# string
	# Description de la sauvegarde
	@description

	# int
	# Date de création de cette sauvegarde
	@dateCreation

	# string
	# Informations sérialisées de la partie
	@contenu

	# int
	# Identifiant de l'utilisateur a qui appartient la sauvegarde
	@idUtilisateur

	# int
	# Identifiant du niveau sur lequel porte cette sauvegarde
	@idNiveau

    attr_accessor :id, :uuid, :version, :description, :dateCreation, :contenu, :idUtilisateur, :idNiveau
	
	### Méthodes de classe
	
	##
	# Instancie une sauvegarde
	#
    def Sauvegarde.creer(*args)
		case args.size
			when 2 # Utilisateur
				new( nil, nil, nil, args[0], nil, args[1].sauvegarder(), args[1].utilisateur.id, args[1].niveau.id )
			when 8 # GEstionnaire
				new( args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7] )
			else
				puts "Sauvegarde.creer n'accepte que 2 ou 8 arguments"
        end
    end
	
	##
	# Constructeur
	#
	private_class_method :new
    def initialize( id, uuid, version, description, dateCreation, contenu, idUtilisateur, idNiveau )
		@id = id
		@uuid = uuid
		@version = ( version == nil ) ? 1 : version
		@description = description
		@dateCreation = ( dateCreation == nil ) ? Time.now.to_i : dateCreation
		@contenu = contenu
		@idUtilisateur = idUtilisateur
		@idNiveau = idNiveau
    end
	
end
