import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String
    func decode(_ plaintext: String, secret: String) -> String
    func alphanumericEncode(_ plaintext: String, secret: Int) -> String
    func alphanumericDecode(_ plaintext: String, secret: Int) -> String
    func mirror(_ plaintext: String) -> String
    //func mirrorDecode(_ plaintext: String) -> String
    func keyboardEncode(_ plaintext: String, secret: Int) -> String
    func keyboardDecode(_ plaintext: String, secret: Int) -> String
}

struct CaesarCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String {
        var encoded = ""
        let shiftBy = UInt32(secret)!

        for character in plaintext
        {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ plaintext:String, secret:String) -> String {
        var decoded = ""
        let shiftBy = UInt32(secret)!
        
        for character in plaintext
        {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
    
    
    func alphanumericEncode(_ plaintext: String, secret: Int) -> String {
        let alphanumericString = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"]
        
        var encoded = ""
        let shiftBy = secret
        
        for character in plaintext
        {
            var i = 0
            while i < alphanumericString.count
            {
                if alphanumericString[i] == String(character)
                {
                    var index = i + shiftBy
                    if index > 35
                    {
                        index = index % 36
                    }
                    encoded.append(alphanumericString[index])
                }
                i=i+1
            }
        }
        return encoded
    }
    
    func alphanumericDecode(_ plaintext: String, secret: Int) -> String {
        let alphanumericString = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"]
        var decoded = ""
        let shiftBy = secret
        
        for character in plaintext
        {
            var i = 0
            while i < alphanumericString.count
            {
                if alphanumericString[i] == String(character)
                {
                    var index = i - shiftBy
                    if index < 0
                    {
                        index = 36 + index
                    }
                    decoded.append(alphanumericString[index])
                }
                i=i+1
            }
        }
        return decoded
        
    }
    
    //Mirror encoding function!
    func mirror(_ plaintext: String) -> String {
        let alphaString = ["a","b","c","d","e","f","g","h","i","j","k","l","m","z","y","x","w","v","u","t","s","r","q","p","o","n"]
        let numericString = ["0","1","2","3","4","9","8","7","6","5"]
       
        var encoded = ""
        
        for char in plaintext
        {
            if alphaString.contains(String(char))
            {
                var alphaIndex = alphaString.index(of: String(char))
                if alphaIndex! <= 12
                {
                    alphaIndex = alphaIndex! + 13
                }
                else if alphaIndex! > 12
                {
                    alphaIndex = alphaIndex! - 13
                }
                encoded.append(alphaString[alphaIndex!])
            }
        
            if numericString.contains(String(char))
            {
                var numericIndex = numericString.index(of: String(char))
                if numericIndex! <= 4
                {
                    numericIndex = numericIndex! + 5
                }
                else if numericIndex! > 4
                {
                    numericIndex = numericIndex! - 5
                }
                encoded.append(numericString[numericIndex!])
            }
        }
        return encoded
    }
    
    
    func mirrorDecode(_ plaintext: String) -> String {
        // This function is same as  mirror encoding! Hence not writing it again! :)
        return "a"
    }
    
    
    func keyboardEncode(_ plaintext: String, secret : Int) -> String {
        //let firstKeyboardRow = ["q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m"]
        let keyboardRow = ["1","2","3","4","5","6","7","8","9","0","q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m"]
        var encoded = ""
        let shiftBy = secret
        
        for character in plaintext
        {
            var i = 0
            while i < keyboardRow.count
            {
                if keyboardRow[i] == String(character)
                {
                    var index = i + shiftBy
                    if index > 35
                    {
                        index = index % 36
                    }
                    encoded.append(keyboardRow[index])
                }
                i=i+1
            }
        }
        return encoded
    }
    
    
    func keyboardDecode(_ plaintext: String, secret : Int) -> String {
        let keyboardRow = ["1","2","3","4","5","6","7","8","9","0","q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m"]
        var decoded = ""
        let shiftBy = secret
        
        for character in plaintext
        {
            var i = 0
            while i < keyboardRow.count
            {
                if keyboardRow[i] == String(character)
                {
                    var index = i - shiftBy
                    if index < 0
                    {
                        index = 36 + index
                    }
                    decoded.append(keyboardRow[index])
                }
                i=i+1
            }
        }
        return decoded
    }

    
}
