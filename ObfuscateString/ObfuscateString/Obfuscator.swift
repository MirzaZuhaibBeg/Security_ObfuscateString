//
//  Obfuscator.swift
//  ObfuscateString
//
//  Created by Mirza Zuhaib Beg on 04/02/20.
//  Copyright © 2020 Mirza Zuhaib Beg. All rights reserved.
//

import Foundation

/// Obfuscate protocol will provide methods for obfuscating string and getting the original string from obfuscated string. This protocol should be implemented by class which wants to obfuscate string.
protocol Obfuscate {
    
    /// Method to obfuscate string
    ///
    /// - Parameter string: string to obfuscate
    /// - Returns: byte array
    func obfuscatedString(string: String) -> [UInt8]

    /// Method to get original string from byte array
    ///
    /// - Parameter byteArray: byte array
    /// - Returns: original string
    func stringFromByteArray(byteArray: [UInt8]) -> String
}

/// Obfuscator class will implement methods from Obfuscate Protocol
class Obfuscator: Obfuscate {
    
    /// Salt will be used to obfuscate
    private var salt: String = "\(String(describing: AppDelegate.self))\(String(describing: NSObject.self))"

    // MARK: - Obfuscate Methods
    /// Method to obfuscate string
    ///
    /// - Parameter string: string to obfuscate
    /// - Returns: byte array
    func obfuscatedString(string: String) -> [UInt8] {
        
        let utf8String = [UInt8](string.utf8)
        let cipher = [UInt8](self.salt.utf8)
        let lengthCipher = cipher.count
        
        var obfuscatedByteArray = [UInt8]()
        
        for text in utf8String.enumerated() {
            obfuscatedByteArray.append(text.element ^ cipher[text.offset % lengthCipher])
        }
        
        return obfuscatedByteArray
    }
    
    /// Method to get original string from byte array
    ///
    /// - Parameter byteArray: byte array
    /// - Returns: original string
    func stringFromByteArray(byteArray: [UInt8]) -> String {
        
        let cipher = [UInt8](self.salt.utf8)
        let lengthCipher = cipher.count
        
        var decryptedByteArray = [UInt8]()
        
        for byte in byteArray.enumerated() {
            decryptedByteArray.append(byte.element ^ cipher[byte.offset % lengthCipher])
        }
        
        if let string = String(bytes: decryptedByteArray, encoding: .utf8) {
            return string
        } else {
            return ""
        }
    }
}
