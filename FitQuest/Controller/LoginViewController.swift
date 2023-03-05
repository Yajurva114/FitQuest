//
//  LoginViewController.swift
//  FitQuest
//
//  Created by yajurva shrotriya on 3/4/23.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.borderColor = UIColor.systemTeal.cgColor
        loginButton.layer.borderWidth = 2
        loginButton.titleLabel?.font = UIFont(name: "Futura", size: 21)
        loginButton.titleLabel?.textColor = UIColor.white
        loginButton.backgroundColor = UIColor.systemTeal
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        // Do any additional setup after loading the view.
        nameTF.delegate = self
        headerView.layer.cornerRadius = 250
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "QuizViewController1") as! QuizViewController1
        UserDefaults.standard.setValue(nameTF.text, forKey: "Name")
        UserDefaults.standard.setValue(0.0, forKey: "calories")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameTF.resignFirstResponder()  //if desired
        return true
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
