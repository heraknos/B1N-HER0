class Controleur

    @jeu
    @vue
    @modele
    @gestionnaireUtilisateur
    @@utilisateur
    @@options = Option.creer(Option::TUILE_ROUGE,Option::TUILE_BLEUE,Langue::FR) 

    def initialize(jeu)
        @jeu = jeu
        @gestionnaireUtilisateur = GestionnaireUtilisateur.instance()
    end

    def getLangue
        return @@options.langue.langueActuelle
    end

    def changerControleur(controleur)
    	@jeu.controleur = controleur
    end

    def quitterJeu
    	Gtk.main_quit
    end
end