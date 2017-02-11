//
//  EasyXMLElement.swift
//  EasyXMLParser
//
//  Created by Fabien on 10/02/2017.
//  Copyright © 2017 Esgi. All rights reserved.
//

import Foundation

public class EasyXMLElement : NSObject{
    
    public var enfants:[EasyXMLElement] = [EasyXMLElement]()   // les sous éléments de l'élément
    public var value:Any?                                   // la valeur de l'élément
    public var parent:EasyXMLElement?                       // le parent de l'élement
    public var name:String                                  // le nom de l'élément
    
    static public let noName:String = ""
    
    init(name: String) {
        self.name = name
    }
    
    
    
    public subscript(key: String) -> EasyXMLElement {
        get {
            var dernierEnfant = EasyXMLElement(name: EasyXMLElement.noName)

            for enfant in enfants {
                
                if (enfant.name == key) {
                    dernierEnfant = enfant
                }
            }
            return dernierEnfant
        }
    }
    
    
    public func count() -> Int {
        if let total = self.parent?.get(name: self.name).count {
            return total
        }
        return 0
    }
    
    public func get(name:String) -> [EasyXMLElement] {
        var listefiltre = [EasyXMLElement]()
        
        for enfant in enfants {
            if (name == enfant.name) {
                listefiltre.append(enfant)
            }
        }
        return listefiltre
    }
    
    public func get() -> [EasyXMLElement] {
        if let papa = self.parent {
            return papa.get(name: self.name)
        }
        return [EasyXMLElement]()
    }
    
    
    public func addEnfant(element:EasyXMLElement) {
        element.parent = self
        enfants.append(element)
    }
    
    public func isValid() -> Bool {
        return (self.name != EasyXMLElement.noName)
    }

    
    override public var description: String{
        return "Je suis \(self.name) dico : \(enfants), value : \(value)"
    }
}
