
import XCTest
@testable import SpyApp

class AlphanumericTests: XCTestCase {
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = CaesarCipher()
    }
    
    func test_stringGetMappedToSelfWith_0_secret()
    {
        let plaintext = "abc"
        let result_alphanumeric_encode = cipher.alphanumericEncode(plaintext, secret: 0)
        let result_alphanumeric_decode = cipher.alphanumericDecode(plaintext, secret: 0)
        
        XCTAssertEqual(plaintext, result_alphanumeric_encode)
        XCTAssertEqual(plaintext, result_alphanumeric_decode)
        
        
    }
    
    func test_consecutiveEncodeDecodeShouldGiveOriginalString(){
        let plaintext = "xyz"
        
        let encodedString = cipher.alphanumericEncode(plaintext, secret: 3)
        let decodedString = cipher.alphanumericDecode(encodedString, secret: 3)
        
        XCTAssertEqual(plaintext, decodedString)
    }
    
}
