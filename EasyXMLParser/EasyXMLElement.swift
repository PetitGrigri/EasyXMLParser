//
//  EasyXMLElement.swift
//  EasyXMLParser
//
//  Created by Fabien on 10/02/2017.
//  Copyright © 2017 Esgi. All rights reserved.
//

import Foundation

public class EasyXMLElement : NSObject{
    private var dico:[String:EasyXMLElement] = [String:EasyXMLElement]()
    public var value:Any?
    public var parent:EasyXMLElement?
    
    private func isValid(key:String) -> Bool {
        if dico[key] != nil {
            return true
        }
        return false
    }
    
    public subscript(key: String) -> EasyXMLElement {
        get {
            if !isValid(key: key) {
                dico[key] = EasyXMLElement()
            }
            return dico[key]!
        }
        set {
            dico[key] = EasyXMLElement()
        }
    }
    
    override public var description: String{
        return "dico : \(dico), value : \(value)"
    }
}
