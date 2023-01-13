require "logger"
require "logger-application"
require "soap/rpc/standaloneServer"
class Document
    attr_reader :isbn,:titre,:dispo
    def initialize(isbn="Inconnu", titre="Inconnu")
        @isbn=isbn
        @titre=titre
        @dispo=true
    end
    def to_s 
        puts "Document ISBN°: #{@isbn} - Titre : #{@titre}"
    end
    #supprimer un document

    #retourne document grace ISBN| excepetion ISBN non connu
   
    #methode rechercherTitre(mot): retourne une collection contenant
    #des reference vers les documents qui comportent la chaîne mot dans leur titre.
    
end
#############################Livre####################
class Livre < Document
    attr_reader:auteurs
    def initialize(isbn,titre)
        super(isbn,titre)
        @auteurs=[]
    end
        #1-afficher les infos du livre Titre & ISBN
    def to_s 
        puts "Livre ISBN°: #{@isbn} - Titre : #{@titre}"
    end

    #ajout dun auteur a un livre
    def ajouter_auteur(auteur)
        @auteurs.push(auteur)
    end
    #Affichage des auteurs dun livre
    def id_aut()
    	@auteurs.each{ |at|
             puts "Auteurs : " 
             at.to_s
             }
	end
    ########livre dispo
    def isAvailable?
        if !@dispo
            raise(DocumentIndisponible,"*document deja emprunté")
        end
    end

    def setDispo(state)
        @dispo = state
    end
end

class Materiel
    attr_reader :id ,:dispo
    @@id1=0
    def initialize()
        @id=@@id1+1
        @@id1+=1
        @dispo=true
    end
    def to_s 
        puts "Matériel N°: #{@id} - disponibilite #{@dispo}"
    end
    ######## materiel dispo
    def isAvailable?
        if !@dispo
            raise(MaterielIndisponible,"*materiel deja emprunté")
        end
    end
    def setDispo(state)
        @dispo = state
    end
    #retourne un materiel coresspond a un id
    #retourne l'ensemble des id des Materiels
end
class OrdinateurPortable < Materiel
    attr_reader :marque
    def initialize(marque)
        super()
        @marque=marque
    end
    def to_s 
        puts "Matériel N°: #{@id} - marque #{@marque} - disponibilite #{@dispo}"
    end
    
end
class Personne
    attr_reader:id , :nom , :prenom
    @@id1=0
    def initialize(nom="Inconnu",prenom="Inconnu")
        @nom=nom
        @prenom=prenom
        @id=@@id1+1
        @@id1+=1
    end
    #getters
    def self.nom
        @nom
    end
    def self.prenom
        @prenom
    end
end
#############################Adherent####################
class Adherent < Personne
    attr_reader :doc_empruntes, :mat_empruntes,:nbr_doc,:nbr_pc
    #constructeur
    def initialize(nom,prenom)
        super(nom,prenom)
        @doc_empruntes=[]
        @mat_empruntes =[]
        @nbr_doc=0
        @nbr_pc=0
    end
    ###############################Afficher les infos d'un adherents:
    #1-afficher les infos de l'adhérent nom & prenom
    def to_s 
        puts "Adhérent N°: #{@id} - #{@nom} #{@prenom}"
    end
    #2-Afficher la liste des emprunts Dun seul adhérent
    def affiche_doc_empruntes()
        if(docs_empruntes.length != 0)
            then docs_empruntes.each{|x| puts x.to_s}
        else
            puts "Cette adhérent n'a pas emprunté de document"
        end
    end
    def affiche_mat_empruntes()
        if(mat_empruntes.length != 0)
            then mat_empruntes.each{|x| puts x.to_s}
        else
            puts "Cette adhérent n'a pas emprunté de mateiel"
        end
    end
    #retourner un adherent selon id | exception : Pas d'ID correspondant
    #Ajout a la liste des documents empruntes
    def emprunterDocument(doc)
        @doc_empruntes.push(doc)
    end
    #Ajout a la liste du materiel empruntés
    def emprunterMateriel(mat)
        @mat_empruntes.push(mat)
    end
    #Rendre materiel 
    def rendreMateriel(mat)
        @mat_empruntes.delete(mat)
    end
    ###########
    def rendreDocument(doc)
        @doc_empruntes.delete(doc)
    end
    
    #Possibilite demprunter document
    def isAdherentEmprunD?
        if @doc_empruntes.length < 5
            return true
        else
            raise(MaxEmpruntAtteint,"vous ne pouvez plus emprunter des documents")
        end
    end
    #possibilité d'emprunter materiel
    def isAdherentEmprunM?
        if @mat_empruntes.length < 1
            return true
        else
            raise(MaxEmpruntAtteint,"vous ne pouvez plus emprunter des ordinateurs")
        end
    end
    
end
#########################################L'ensemble################################
############################Auteur########################
class Auteur < Personne
    def initialize(nom,prenom)
        super(nom,prenom)
    end
    def to_s 
        puts "Auteur N°: #{@id} - #{@nom} #{@prenom}"
    end

    #retourner un adherent selon id | exception : Pas d'ID correspondant
    #retour lensemble des ids des auteurs (de tout les livre ou dun seul livre)
end
class Biblio
    attr_accessor :listAdh,:listMat,:listDoc,:listEmpDoc,:listEmpMat
    def initialize
      @listAdh=[]
      @listMat=[]
      @listDoc=[]
      @listAuteur=[]
      @listEmpDoc=[]
      @listEmpMat=[]
    end
    #liste des adherents
    def addAdh(adherent)
        @listAdh.push(adherent)
    end
    def afficheAdh()
        for ad in @listAdh 
            ad.to_s
        end
    end
    #chercher adherent correspondant a un id
    def chercherAdh(ida)
        for ad in @listAdh
            if (ad.id == ida)
                return ad
            end
        end
        raise(PersonneInexistante,"adherent inexistant")
    end
    #chercher auteur par id
    def chercherAuteur(ida)
        for at in @listAuteur
            if (at.id == ida)
                return at
            end
        end
        raise(PersonneInexistante,"auteur inexistant")
    end
    #Document corespondant a un ISBN
    def chercherDoc(isbn)
        for doc in @listDoc
            if (doc.isbn == isbn)
                return doc
            end
        end
        raise(DocumentInexistant,"document inexistant")
    end
    #Document grace a un id
     def chercherMat(idm)
        for mat in @listMat
            if mat.id == idm
                return mat
            end
        end
        raise(MaterielInexistant,"Materiel inexistant")
    end
    #supprimer adherent
    def supprimerAdh(adherent)
        @listAdh.delete(adherent)
    end
    #supprimer materiel
    def supprimerMat(materiel)
        @listMat.delete(materiel)
    end
    #supprimer doc
    def supprimerDoc(document)
        @listDoc.delete(document)
    end
    #liste des auteurs
    def addAut(auteur)
        @listAuteur.push(auteur)
    end
    def afficheAut()
        for at in @listAuteur
            at.to_s
        end
    end
    def afficheridAut()
        for at in @listAuteur
           puts " #{at.id}"
        end
    end

   

   
    #liste des documents
    def addDoc(document)
        @listDoc.push(document)
    end
    def afficheDoc()
        for doc in @listDoc 
            doc.to_s
        end
    end
  
  
    #list des materiels
    def addMat(materiel)
        @listMat.push(materiel)
    end
    def afficheMat
        for mat in @listMat 
            mat.to_s
        end
    end
    def afficheridMat()
        for mat in @listMat
           puts " #{mat.id}"
        end
    end
   
    #############Ajouter aux documents empruntes
    def addEmpruntDoc(doc)
        @listEmpDoc.push(doc)
    end
    ####################supprimer emprunt
    def supEmpruntDoc(doc)
        @listEmpDoc.delete(doc)
    end
    ##########################
    def afficheEmpruntDoc()
        for doc in @listEmpDoc
            doc.to_s
        end
    end
    ############################### Ajouter au materiel empruntes
    def addEmpruntMat(mat)
        @listEmpMat.push(mat)
    end
    #############################Supprimer emprunt
    def supEmpruntMat(mat)
        @listEmpMat.delete(mat)
    end
    #############################
    def supEmpruntDoc(doc)
        @listEmpDoc.delete(doc)
    end
    ####################
    def afficheEmpruntMat()
        for mat in @listEmpMat
            mat.to_s
        end
    end
    ############################################CSV##################################
    def adh_to_csv #ajouter les adherants à un fichier.csv
        CSV.open('adherants.csv', "w") do |csv|
          csv << ["ID", "Nom", "Prenom", "Documents empruntés", "Matériel Emprunté"]
          @listAdh.each { |adh|
            csv << [adh.id, adh.nom, adh.prenom, adh.doc_empruntes, adh.mat_empruntes]
          }
        end
    end
    ################## a partir dun fichier csv 
      def adh_from_csv
        table = CSV.parse(File.read("adherants.csv"), headers: true)
        table.each do |row|
          adh = Adherent.new( row['Nom'], row['Prenom'])
          @listAdh.push(adh)
        end
        puts "La nouvelle liste d'adherants"
        puts @listAdh
      end
    #############################################################
    def trouver_mot(mot)
       l= @listDoc.select{|doc|
            doc.titre.include?(mot)
        }
        for t in l
            t.to_s
        end
    end
end

#########################################
class PersonneInexistante < RuntimeError
end

class DocumentInexistant < RuntimeError
end

class MaterielInexistant < RuntimeError
end
########################################
class DejaEmprunte < RuntimeError
end
#########################
class MaterielIndisponible < RuntimeError
end
########################################
class DocumentIndisponible < RuntimeError
end

#ajouter un adherent a la bibilotheque
#bib.add
#ajouter un livre a la bibliotheque
#ajouter ordinateur a la bibilotheque
##################################Les collections -Listes#########
#la collection des adherents
#La liste des documents
#La collection des materiels
#########################
#supprime un adherent de la biblio
#supprime un materiel de la biblio
#supprimer un document de la biblio

begin
    class Myserver < SOAP::RPC::StandaloneServer
        attr_accessor :biblio
        def initialize(*args)
            super
            @biblio=Biblio.new
            add_method(self, 'creerAdherant', 'nom','prenom')
        end

        def creerAdherant(nom,prenom)
            adherant=Adherent.new(nom,prenom)
            biblio.addAdh(adherant)
        end
    end
    server = Myserver.new("Myserver", 'urn:ruby:biblio', 'localhost', 8081)
    server.start
rescue => err
    puts err.message
end
