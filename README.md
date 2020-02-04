# Security_ObfuscateString
String Obfuscator written in Swift that protects your sensitive strings against reverse engineering attacks. Lack of code obfuscation allows an attacker to get a greater understanding of the internal class structure and how the application binary works, and allows them to get the binary in a suitable state for reverse engineering.


Code usage:
        let stringToObfuscate = "API_KEY"
        let obfuscatedString = obfuscator.obfuscatedString(string: stringToObfuscate)
        let stringFromByteArray = obfuscator.stringFromByteArray(byteArray: obfuscatedString)
       
       
Use ObfuscatorTest (test case) for testing your string obfuscation and decryption.

func testObfuscatedString() {
        let stringToObfuscate = "API_KEY"
        let obfuscatedString = obfuscator.obfuscatedString(string: stringToObfuscate)
        let stringFromByteArray = obfuscator.stringFromByteArray(byteArray: obfuscatedString)
        XCTAssertEqual(stringFromByteArray, stringToObfuscate)
}
