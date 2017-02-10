//
//  RSSXMLParser.swift
//  Exemple_RSS
//
//  Created by Fabien on 17/12/2016.
//  Copyright © 2016 PetitGrigri. All rights reserved.
//

import UIKit

/**
  * Un Delegate de Parser XML qui a pour but de parcourir une liste d'item RSS
  *
  *
  */
public class EasyXMLParserDelegate: NSObject, XMLParserDelegate {
    
    var itemInProgress:[String] = [] // contiendra la liste le nom des éléments en cours de parcours
    
    var items = EasyXMLElement() //va contenir la collection correspodant au xml
    
    var elementEnCours:EasyXMLElement //l'élément en cours

    var tempoRead:String = "" //une variable contenant la valeur d'un élément en cours de lecture

    
    override init() {
        elementEnCours = items
    }
    
    /**
      * Cette méthode est appellée lorsqu'elle rencontre un nouvel élément XML.
      * Dans tout les cas on mémorisera l'élément en cours de "lecture"
      */
     public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]){

        print("\n didStartElement : \(elementName)")
        
        elementEnCours.parent = elementEnCours
        elementEnCours = elementEnCours[elementName]
        

        print("elementEnCours : \(elementEnCours)")
        print(" |=> parent : \(elementEnCours.parent)")
        //self.itemInProgress.append(elementName)
    }

    
    /*
    private func getElementEnCours() -> [String : Any]{
        //TODO
        //TODO dans le didStart Element : vérifier si l'élément en cours existe et le créer ou le transformer en array
        //TODO BIS ne pas oublier florent
    }
    */
    
    
    
    
    
    
    
    /**
     * Cette méthode est appellée lorsqu'elle rencontre la fin d'un élément XML
     * Elle permet de vider la mémorisation de l'élément en cours et de ne pas le remplir avec des données fausses
     */
     public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        
        
        tempoRead = String(tempoRead.characters.filter { !"\n\t\r".characters.contains($0) })
        tempoRead = tempoRead.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        

        elementEnCours.value = tempoRead
        
        print("didEndElement \(elementName) : \(elementEnCours.value)")
        
        if (elementEnCours.parent != nil) {
            elementEnCours = elementEnCours.parent!
        } else {
            elementEnCours = items
        }
        
        self.tempoRead = ""

    }

    
    
    /**
     * Cette méthode est appellée lorsqu'elle lit le contenu d'une balise XML
     * Juste avant, le parser didStartElement aura été appellé
     */
    public func parser(_ parser: XMLParser, foundCharacters string: String){
        //print("foundCharacters : \(string)")
        
        self.tempoRead.append(string)

       

    }
    
    public func parser(_ parser: XMLParser, foundCDATA CDATABlock: Data){
        
        
        if let tempo = String.init(data: CDATABlock, encoding: .utf8) {
            //print("foundCDATA \(tempo)")
            self.tempoRead.append(tempo)
        } else {
            //print("foundCDATA VIDE")
        }
    }
    
    
    /*
    
    
    public func parserDidStartDocument(_ parser: XMLParser) {
        //print("Début du parsing du document XML")
    }
    
    
    public func parserDidEndDocument(_ parser: XMLParser) {
        //print("Fin du parsing du document XML")
    }
    
    
    public func parser(_ parser: XMLParser, foundNotationDeclarationWithName name: String, publicID: String?, systemID: String?) {
        //print("foundNotationDeclarationWithName")
    }
    
    
    public func parser(_ parser: XMLParser, foundUnparsedEntityDeclarationWithName name: String, publicID: String?, systemID: String?, notationName: String?){
        //print("foundUnparsedEntityDeclarationWithName")
    }
    
    
    public func parser(_ parser: XMLParser, foundAttributeDeclarationWithName attributeName: String, forElement elementName: String, type: String?, defaultValue: String?){
        //print("foundAttributeDeclarationWithName")
    }
    
    
    public func parser(_ parser: XMLParser, foundElementDeclarationWithName elementName: String, model: String){
        //print("foundElementDeclarationWithName")
    }
    
    
    public func parser(_ parser: XMLParser, foundInternalEntityDeclarationWithName name: String, value: String?){
        //print("foundInternalEntityDeclarationWithName")
    }
    
    
    
    public func parser(_ parser: XMLParser, foundExternalEntityDeclarationWithName name: String, publicID: String?, systemID: String?){
        //print("foundExternalEntityDeclarationWithName")
    }
    

    
     public func parser(_ parser: XMLParser, didStartMappingPrefix prefix: String, toURI namespaceURI: String){
        //print("didStartMappingPrefix")
    }

    
    
     public func parser(_ parser: XMLParser, didEndMappingPrefix prefix: String){
        //print("didEndMappingPrefix")
    }

 


    
    
     public func parser(_ parser: XMLParser, foundIgnorableWhitespace whitespaceString: String){
        //print("foundIgnorableWhitespace")
    }

    
    
     public func parser(_ parser: XMLParser, foundProcessingInstructionWithTarget target: String, data: String?){
        //print("foundProcessingInstructionWithTarget")
    }

    
    
     public func parser(_ parser: XMLParser, foundComment comment: String){
        //print("foundComment")
    }

    
    
     public func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error){
        //print("parseErrorOccurred")
     }
     
     
     
     public func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error){
        //print("validationErrorOccurred")
     }
 
    
    
    //optional public func parser(_ parser: XMLParser, resolveExternalEntityName name: String, systemID: String?) -> Data?
 */
    
 }
