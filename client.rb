require 'soap/rpc/driver'

NAMESPACE = 'urn:ruby:biblio'
URL = 'http://localhost:8081/'

begin
    driver = SOAP::RPC::Driver.new(URL, NAMESPACE)
    driver.add_method('creerAdherant', 'nom','prenom')

    fin=false
    while !fin
        puts "entrer votre choix"
        puts "
        1- Créer un adhérent et l'ajouter à la bibliothèque
        2- Créer un livre et l'ajouter à la bibliothèque
        3- Créer un ordinateur portable et l'ajouter à la bibliothèque
        4- Retourner un adhèrent correspondant à un id de personne
        5- Retourner un document correspondant à un isbn
        6- Retourner un matériel correspondant à un id
        7- Retourner la collection des adhérents de la bibliothèque
        8- Retourner la liste des documents de la bibliothèque
        9- Retourner la collection des matériels de la bibliothèque
        10- Ajouter une personne aux auteurs d’un livre.
        11- Retourner un auteur d’un livre correspondant à un id
        12- Retourner L'ensemble des Ids des auteurs
        13- Retourner L'ensemble des Id des matériels
        14- Supprimer un adhérent de la bibliothèque
        15- Supprimer un matériel de la bibliothèque
        16- Supprimer un document de la bibliothèque
        17- Emprunter un Ordinateur
        18- Emprunter un Livre
        19- Rendre un Ordinateur
        20- Rendre un Livre
        21- Enregistre la bibliothèque dans des fichiers CSV
        22- Charger la bibliothèque à partir des fichiers CSV
        23- Rechercher un document.
        "
        choix=gets.chomp().to_i
        case choix
        when 1
            nom=gets.chomp
            prenom=gets.chomp
            driver.creerAdherant(nom,prenom)
        else
            puts "fin"
            fin=true
        end
    end
        
rescue => err
    puts err.message
end