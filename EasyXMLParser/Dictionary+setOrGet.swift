//
//  Dictionary+setOrGet.swift
//  EasyXMLParser
//
//  Created by Fabien on 10/02/2017.
//  Copyright © 2017 Esgi. All rights reserved.
//

import Foundation

extension Dictionary {
    public mutating func ifFound(key: Key, returnValueOrReturnAfterSetWith value:Value) -> Optional<Value>
    {
        if let valueElement = self[key] {
            return valueElement;
        }
        self[key] = value
        
        return self[key]!

    }
}
