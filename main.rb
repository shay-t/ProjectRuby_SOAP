require'csv'
$LOAD_PATH.unshift(__dir__)
require_relative'personne.rb'
require_relative'biblio.rb'
require_relative'document.rb'
require_relative'materiel.rb'


class Test
    bib=Biblio.new()
    fin=false
    while !fin
        puts "\n"
        puts "************************************************************\n"
        puts "Menu"
        puts "************************************************************\n"
        puts "1-Lancer le menu pour choisir"
        puts "2-Quitter"
        puts "\n"
        puts "Effectuer un choix :"
        puts "************************************************************\n"
        choice1 = gets.chomp
        a = choice1.to_i
        puts "\n"
        case a
            when 2
                fin=true
            when 1 
            while !fin
                puts "************************************************************\n"
                puts "Menu \n"
                puts "************************************************************\n"
                puts "1-Ajouter un adhérent à la bibliothèque"
                puts "2-Ajouter un livre à la bibliothèque"
                puts "3-Ajouter un Ordinateur portable à la bibliothèque"
                puts "\n"
                puts "************************************************************\n"
                puts "4-Retourne un adhèrent correspondant à un id de personne"
                puts "5-Retourne un document correspondant à un ISBN"
                puts "6-Retourne un matériel correspondant à un id"
                puts "\n"
                puts "************************************************************\n"
                puts "7-Afficher la liste des adhérents de la bibliothèque"
                puts "8-Afficher la liste des documents de la bibliothèque"
                puts "9-Afficher la liste des materiels de la bibliothèque"
                puts "\n"
                puts "************************************************************\n"
                puts "10-Ajouter une personne aux auteurs d’un livre"
                puts "11-Retourner un auteur d’un livre correspondant à un id"
                puts "12-Retourne L'ensemble des Ids des auteurs"
                puts "\n"
                puts "************************************************************\n"
                puts "13-Retourne L'ensemble des Ids des materiels"
                puts "\n"
                puts "************************************************************\n"
                puts "14-Supprimer un adhérent de la bibliothèque"
                puts "15-Supprimer un matériel de la bibliothèque"
                puts "16-Supprimer un document de la bibliothèque"
                puts "\n"
                puts "************************************************************\n"
                puts "17-Emprunter un Ordinateur"
                puts "18-Emprunter un Livre"
                puts "\n"
                puts "************************************************************\n"
                puts "19-Rendre un Ordinateur"
                puts "20-Rendre un Livre"
                puts "\n"
                puts "************************************************************\n"
                puts "21-Enregistrer la bibliothèque dans des fichiers CSV"
                puts "22-Charge la bibliothèque à partir des fichiers CSV"
                puts "\n"
                puts "************************************************************\n"
                puts "23-Lister documents qui comportent la chaine introduite dans le titre"
                puts "\n"
                puts "************************************************************\n"
                choice2 = gets.chomp
                b = choice2.to_i
                case b 
                when 1
                    ad1=Adherent.new('chayma','tlemcani')
                    ad1.to_s
                    ad2=Adherent.new('youssra','hhh')
                    ad2.to_s
                    bib.addAdh(ad1)
                    bib.addAdh(ad2)
                    bib.afficheAdh
                    sleep(5)
                when 2
                    l1=Livre.new("1236","Titre")
                    l1.to_s
                    at1=Auteur.new("Thomas","shelby")
                    l1.ajouter_auteur(at1)
                    l1.afficher_auteur
                    bib.addDoc(l1)
                    list=bib.afficheDoc
                    list.display()
                when 3
                    o1=OrdinateurPortable.new("HP")
                    o1.to_s
                    bib.addMat(o1)
                    list=bib.afficheMat
                    list.display
                when 4
                    ad1=Adherent.new('chayma','tlemcani')
                    bib.addAdh(ad1)
                    begin
                        a=bib.chercherAdh(12)
                    rescue PersonneInexistante => e
                        puts e.message
                    end
                    sleep(5)
                when 5
                    l1=Livre.new("36","Vendredi ou la vie")
                    bib.addDoc(l1)
                    begin
                        a=bib.chercherDoc(6)
                    rescue DocumentInexistant => e
                        puts e.message
                    end
                    sleep(5)
                when 6
                    mat=Materiel.new()
                    bib.addMat(mat)
                    a=bib.chercherMat(12)
                    begin
                        a=bib.chercherMat(12)
                    rescue MaterielInexistant => e
                        puts e.message
                    end
                    sleep(5)
                when 7
                    ad1=Adherent.new('chayma','tlemcani')
                    ad2=Adherent.new('youssra','hhh')
                    bib.addAdh(ad1)
                    bib.addAdh(ad2)
                    bib.afficheAdh
                    sleep(5)
                when 8
                    doc1=Document.new()
                    l1=Livre.new('1236','Heelo')
                    bib.addDoc(doc1)
                    bib.addDoc(l1)
                    bib.afficheDoc
                    sleep(5)
                when 9
                    o1=OrdinateurPortable.new("Mac")
                    mat=Materiel.new()
                    bib.addMat(o1)
                    bib.addMat(mat)
                    bib.afficheMat
                when 10
                    l1=Livre.new("36","Vendredi ou la vie")
                    at1=Auteur.new("christian","shell")
                    l1.ajouter_auteur(at1)
                    bib.addDoc(l1)
                    begin
                        a=bib.chercherDoc("36")
                        at2=Auteur.new("Thomas","shelby")
                        l1.ajouter_auteur(at2)
                        l1.afficher_auteur
                    rescue DocumentInexistant => e
                        puts e.message
                    end
                when 11
                    l1=Livre.new("36","Vendredi ou la vie")
                    at1=Auteur.new("christian","shell")
                    at2=Auteur.new("Thomas","shelby")
                    l1.ajouter_auteur(at1)
                    l1.ajouter_auteur(at2)
                    bib.addAut(at1)
                    bib.addAut(at2)
                    begin
                        a=bib.chercherAuteur(1)
                    rescue PersonneInexistante => e
                        puts e.message
                    end
                    sleep(5)
                when 12
                    l1=Livre.new("36","Vendredi ou la vie")
                    l2=Livre.new('1236','Heelo')
                    at1=Auteur.new("christian","shell")
                    at2=Auteur.new("Thomas","shelby")
                    l1.ajouter_auteur(at1)
                    l2.ajouter_auteur(at2)
                    bib.addAut(at1)
                    bib.addAut(at2)
                    bib.afficheridAut()
                    sleep(5)
                when 13
                    o1=OrdinateurPortable.new("Mac")
                    mat=Materiel.new()
                    bib.addMat(o1)
                    bib.addMat(mat)
                    bib.afficheridMat()
                    sleep(5)
                when 14
                    ad1=Adherent.new('chayma','tlemcani')
                    ad2=Adherent.new('chay','youss')
                    bib.addAdh(ad1)
                    bib.addAdh(ad2)
                    bib.afficheAdh
                    begin
                        a=bib.chercherAdh(1)
                        bib.supprimerAdh(a)
                    rescue PersonneInexistant => e
                        puts e.message
                    end
                    bib.afficheAdh
                    sleep(5)
                when 15
                    #supprimer materiel
                    o1=OrdinateurPortable.new("Mac")
                    mat=Materiel.new()
                    bib.addMat(o1)
                    bib.addMat(mat)
                    bib.afficheMat()
                    begin
                        a=bib.chercherMat(1)
                        bib.supprimerMat(a)
                    rescue MaterielInexistant => e
                        puts e.message
                    end
                    bib.afficheMat
                    sleep(5)
                when 16
                    #supprimer document
                    doc1=Document.new()
                    l1=Livre.new('1236','Heelo')
                    l1.ajouter_auteur(at1)
                    bib.addAut(at1)
                    bib.addDoc(l1)
                    bib.addDoc(doc1)
                    bib.afficheDoc
                    begin
                        a=bib.chercherDoc('1236')
                        bib.supprimerDoc(a)
                    rescue DocumentInexistant => e
                        puts e.message
                    end
                    bib.afficheAdh
                    bib.afficheDoc
                    sleep(5)
                when 17
                    #materiel
                    ad1=Adherent.new('chayma','tlemcani')
                    ad1.to_s
                    bib.addAdh(ad1)
                    o1=OrdinateurPortable.new("hp")
                    o2=OrdinateurPortable.new("mac")
                    bib.addMat(o1)
                    bib.addMat(o2)
                    bib.afficheAdh
                    begin
                        ad=bib.chercherAdh(1)
                        mat=bib.chercherMat(1)
                        mat2=bib.chercherMat(2)
                        mat.isAvailable?
                        ad.emprunterMateriel(mat)
                        mat.setDispo(false)
                        bib.addEmpruntMat(mat)
                        bib.afficheEmpruntMat()
                        ####################
                        mat2.setDispo(false)
                        mat2.isAvailable?
                        ad.emprunterMateriel(mat2)
                        mat2.setDispo(false)
                        bib.addEmpruntMat(mat2)
                        bib.afficheEmpruntMat()
                    rescue PersonneInexistante => e
                        puts e.message
                    rescue MaterielInexistant => e
                        puts e.message
                    rescue MaterielIndisponible => e
                        puts e.message
                    rescue MaxEmpruntAtteint => e
                        puts e.message        
                    end

                ###############################################################
                
                    
                when 18
                    #document
                    ad1=Adherent.new('chayma','tlemcani')
                    ad1.to_s
                    bib.addAdh(ad1)
                    l1=Livre.new("365","Titre1")
                    l2=Livre.new("236","Titre2")
                    bib.addDoc(l1)
                    bib.addDoc(l2)
                    bib.afficheAdh

                    begin
                        ad=bib.chercherAdh(1)
                        doc1=bib.chercherDoc("365")
                        doc2=bib.chercherDoc("236")
                        ad.emprunterDocument(doc1)
                        doc1.setDispo(false)
                        bib.addEmpruntDoc(doc1)
                        bib.afficheEmpruntDoc()
                        ad.emprunterDocument(doc2)
                        doc2.setDispo(false)
                        bib.addEmpruntDoc(doc2)
                        bib.afficheEmpruntDoc()                        
                    rescue PersonneInexistante => e
                        puts e.message
                    rescue DocumentInexistant => e
                        puts e.message
                    rescue DocumentIndisponible => e
                        puts e.message
                    rescue MaxEmpruntAtteint => e
                        puts e.message    
                    ensure
                        sleep(5)    
                    end

                when 19   
                    begin
                        ad=bib.chercherAdh(1) 
                        mat=bib.chercherMat(1)
                        ad.rendreMateriel(mat)
                        mat.setDispo(true)
                        bib.supEmpruntMat(mat)
                        bib.afficheEmpruntMat()    
                    rescue PersonneInexistante => e
                        puts e.message
                    rescue MaterielInexistant => e
                        puts e.message
                    ensure
                        sleep(5)
                    end


                when 20
                    #livre
                    begin
                        ad=bib.chercherAdh(1) 
                        doc=bib.chercherDoc("365")
                        ad.rendreDocument(doc)
                        doc.setDispo(true)
                        bib.supEmpruntDoc(doc)
                        bib.afficheEmpruntDoc() 
                    rescue PersonneInexistante => e
                        puts e.message
                    rescue DocumentInexistant => e
                        puts e.message
                    ensure
                        sleep(5)
                    end


                when 21
                    #enregister
                    begin
                        ad1=Adherent.new('chayma','tlemcani')
                        ad2=Adherent.new('youssra','hhh')
                        bib.addAdh(ad1)
                        bib.addAdh(ad2)
                        bib.afficheAdh
                        bib.adh_to_csv                         
                    rescue => e
                        puts e.message
                    ensure
                        sleep(5)
                    end

                when 22
                    bib.adh_from_csv
                when 23
                    l1=Livre.new("36","Vendredi ou la vie")
                    l2=Livre.new("69","Vendredi ou dimanche")
                    l3=Livre.new("102","lundi")
                    bib.addDoc(l1)
                    bib.addDoc(l2)
                    bib.addDoc(l3)
                    bib.trouver_mot("Vendredi")
            end
        end
    end
end   
end