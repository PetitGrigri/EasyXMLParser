//
//  EasyXMLParser.swift
//  EasyXMLParser
//
//  Created by Fabien on 06/02/2017.
//  Copyright © 2017 com.4amoc1.groupe10. All rights reserved.
//

import UIKit

public class EasyXMLParser : NSObject {
    
    private let dataToParse: Data
    //créer un constructeur convenience à base de string (tout comme un parser XML)
    
    //créer un constructeur convenience à base d'URL (tout comme un parser XML)
    
    /*
     * Constructeur de l'objet, il pourra recevoir tout comme un ParserXML des Data (contenant du XML)
     */
    public  init(withData: Data) {
        print("J'ai reçu des data à Parser.")
        
        self.dataToParse = withData;
    }
    
    /*
     * Méthode qui sera appeller pour parser puis renvoyer un array contenant 
     * une ou plusieurs fois la collection demandée par l'utilisateur. 
     */
    public func fill(collection : [String:Any]) -> [[String:Any]] {
        
        print("On m'a demandé de remplir avec une collection ")
        //parse()
        
        return [["item" : ["title":  "Faites de vos QR Codes de veritables ...",
                           "link":   "https://korben.info/de-vos-qr-codes-de-veritables-oeuvres-dart.html",
                           "category": ["Script", "Service web", "QR Code"]]]]
    }
    
    

    
    
    
    public func fill(objectName : String) -> [Any] {
        print("\nOn m'a demandé de remplir un objet nommé \("Item")\n")
        
        
        var tempoArray:[Any] = [Any]()
        
        var instance: AnyObject! = nil
        if let classInst = NSClassFromString(objectName) as? NSObject.Type {
            //print (classInst)
            
            instance = classInst.init() // create the instance from this class
            
            //print("J'ai une instance \(instance)")
            
            let aMirror = Mirror(reflecting: instance)
            
            //print("J'ai un mirroir \(aMirror)")
            
            /*for case let (label?, value) in aMirror.children {
                print ("label : \(label), type : \(Mirror(reflecting:value).subjectType)")
            }*/

            instance.setValue("Faites de vos QR Codes de veritables ...", forKey: "Title")
            instance.setValue("https://korben.info/de-vos-qr-codes-de-veritables-oeuvres-dart.html", forKey: "Link")
            instance.setValue(["Script","Service web","QR Code"], forKey: "category")
            
            
            tempoArray.append(instance)
            
        }
        
         return tempoArray
        
    }
    
    
    
    
    
    
    
    /*
     * Méthode qui permettra de parser le fichier xml avec notre EasyXMLParser
     */
    private func parse() {
        print("On m'a demandé de parser les Data fournis lors de mon initialisation")
        
   
        if let myParser = try? XMLParser.init(data: self.dataToParse) {

            let delegateTest = EasyXMLParserDelegate()
            
            myParser.delegate = delegateTest
            
            myParser.parse()
            print("test")
        }
    

        //voir ce qu'on revoie ici : le parser ou ce qu'on aura récupéré (en brut sans filtre)
    }
    
    
    
}
