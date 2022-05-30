//
//  LoginViewController.swift
//  AlkeMovies
//
//  Created by Pablo Manzur on 21/05/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        mailTextField.delegate = self
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        if mailTextField.text!.isEmpty {
            showAlert(of:"Campo vacío", saying:"Por favor complete el campo de mail para loguearse")
        }
        else if !isValidEmail(mailTextField.text!) {
            showAlert(of:"Formato de mail incorrecto", saying:"Por favor ingrese una dirección de mail válida")
        }
        else {
            self.navigationController?.pushViewController(MovieListViewController(), animated: true)
        }
    }
    
    private func setUpView(){
        titleLabel.font = UIFont(name: "Marker Felt Wide", size: 36)
        titleLabel.textColor = .white
        loginButton.tintColor = .red
    }


    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }

    
    private func showAlert(of title: String, saying message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}



//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
}
