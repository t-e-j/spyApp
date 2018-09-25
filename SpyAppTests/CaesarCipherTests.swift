
import XCTest
@testable import SpyApp

class CaesarCipherTests: XCTestCase {

    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = CaesarCipher()
    }
    
    func test_oneCharacterStringGetsMappedToSelfWith_0_secret() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let plaintext = "a"
        
        let result_caesar_encode = cipher.encode(plaintext, secret: "0")
        let result_caesar_decode = cipher.decode(plaintext, secret: "0")

        XCTAssertEqual(plaintext, result_caesar_encode)
        XCTAssertEqual(plaintext, result_caesar_decode)
        
    }
    
    func test_consecutiveEncodeDecodeShouldGiveOriginalString(){
        let plaintext = "xyz"
        
        let encodedString = cipher.encode(plaintext, secret: String(3))
        let decodedString = cipher.decode(encodedString, secret: String(3))
        
        XCTAssertEqual(plaintext, decodedString)
    }
    
//    func test_nonNumericInputForSecret() {
//        let result = cipher.encode("b", secret: "nonNumericString")
        
//        XCTAssertNil(result)
//    }
    
}
