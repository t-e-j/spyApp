import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] =
    [
        "Caesar": CaesarCipher(),
        "Alphanumeric": CaesarCipher(),
        "Mirror": CaesarCipher(),
        "KeyBoard": CaesarCipher()
    ]

    func cipher(for key: String) -> Cipher
    {
        return ciphers[key]!
    }
}
