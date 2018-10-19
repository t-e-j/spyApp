import UIKit

class SpyAppViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!

    let factory = CipherFactory()
    var cipher: Cipher?
    var selectedCipher = ""
    
    var plaintext: String{
        if let text = input.text
        {
            return text
        }
        else
        {
            return ""
        }
    }
    
    var secretText: String{
        if let text = secret.text
        {
            return text
        }
        else
        {
            return ""
        }
    }
    
    

    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        if let cipher=self.cipher
        {
            switch selectedCipher {
            case "Caesar" :
                guard let secretInt = Int(secretText) else {
                    print("Enter valid secret key (Only integers accepted!)")
                    return
                }
                output.text = cipher.encode(plaintext, secret: secretText)
            case "Alphanumeric" :
                guard let secretInt = Int(secretText) else {
                    print("Enter valid secret key (Only integers accepted!)")
                    return
                }
                output.text = cipher.alphanumericEncode(plaintext, secret: Int(secretText)!)
            case "Mirror" :
                guard let secretInt = Int(secretText) else {
                    print("Enter valid secret key (Only integers accepted!)")
                    return
                }
                secret.text = "Secret key is not required for mirror!"
                output.text = cipher.mirror(plaintext)
            case "KeyBoard" :
                guard let secretInt = Int(secretText) else {
                    print("Enter valid secret key (Only integers accepted!)")
                    return
                }
                output.text = cipher.keyboardEncode(plaintext, secret: Int(secretText)!)
            default :
                output.text = "Some error occurred in switch case!"

            }
        }
        else
        {
            output.text = "No cipher selected!"
        }
        
    }
    

    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        guard
            let buttonLabel = sender.titleLabel,
            let buttonText = buttonLabel.text
        else
        {
            output.text = "No button or no button text"
            return
        }
        selectedCipher = buttonText
        cipher = factory.cipher(for: buttonText)
    }
    
    
    @IBAction func decodeButtonPressed(_ sender: UIButton) {
        if let cipher=self.cipher{
            //output.text = cipher.decode(plaintext, secret: secretText)
            
            switch selectedCipher {
            case "Caesar" :
                output.text = cipher.decode(plaintext, secret: secretText)
            case "Alphanumeric" :
                output.text = cipher.alphanumericDecode(plaintext, secret: Int(secretText)!)
            case "Mirror" :
                secret.text = "Secret key is not required for mirror!"
                output.text = cipher.mirror(plaintext)
            case "KeyBoard" :
                output.text = cipher.keyboardDecode(plaintext, secret: Int(secretText)!)
            default :
                output.text = "Some error occurred in switch case!"
            }
        }
        else
        {
            output.text="No cipher selected!"
        }
    }
    

}

