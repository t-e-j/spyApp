
import XCTest
@testable import SpyApp

class MirrorTests: XCTestCase {
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = CaesarCipher()
    }
  
    
    func test_consecutiveEncodeDecodeShouldGiveOriginalString(){
        let plaintext = "xyz123"
        
        let encodedString = cipher.mirror(plaintext)
        let decodedString = cipher.mirror(encodedString)
        
        XCTAssertEqual(plaintext, decodedString)
    }

    
}
