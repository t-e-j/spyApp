
import XCTest
@testable import SpyApp

class KeyboardTests: XCTestCase {
    var cipher : Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = CaesarCipher()
    }
    
    func test_stringGetMappedToSelfWith_0_secret() {
        let plaintext = "abc"
        let result_keyBoard_encode = cipher.keyboardEncode(plaintext, secret: 0)
        let result_keyBoard_decode = cipher.keyboardDecode(plaintext, secret: 0)
        
        XCTAssertEqual(plaintext, result_keyBoard_encode)
        XCTAssertEqual(plaintext, result_keyBoard_decode)
        
    }
    
    func test_consecutiveEncodeDecodeShouldGiveOriginalString(){
        let plaintext = "xyz"
        
        let encodedString = cipher.keyboardEncode(plaintext, secret: 3)
        let decodedString = cipher.keyboardDecode(encodedString, secret: 3)
        
        XCTAssertEqual(plaintext, decodedString)
    }
    
}
