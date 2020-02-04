//
//  ObfuscatorTest.swift
//  ObfuscateStringTests
//
//  Created by Mirza Zuhaib Beg on 04/02/20.
//  Copyright © 2020 Mirza Zuhaib Beg. All rights reserved.
//

import XCTest
@testable import ObfuscateString

class ObfuscatorTest: XCTestCase {

    var obfuscator: Obfuscate = Obfuscator()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testObfuscatedString() {
        let stringToObfuscate = "127.0.0.1"
        let obfuscatedString = obfuscator.obfuscatedString(string: stringToObfuscate)
        let stringFromByteArray = obfuscator.stringFromByteArray(byteArray: obfuscatedString)
        XCTAssertEqual(stringFromByteArray, stringToObfuscate)
    }
}
