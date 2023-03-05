//
//  ViewController.swift
//  FitQuest
//
//  Created by yajurva shrotriya on 3/4/23.
//

import UIKit

class LaunchViewController: UIViewController {
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.borderColor = UIColor.systemTeal.cgColor
        startButton.layer.borderWidth = 2
        startButton.titleLabel?.font = UIFont(name: "Futura", size: 21)
        startButton.titleLabel?.textColor = UIColor.white
        startButton.backgroundColor = UIColor.systemTeal
        startButton.layer.cornerRadius = 30
        // Do any additional setup after loading the view.
        
        headerView.layer.cornerRadius = 250
    }

    @IBAction func getStarted(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
}

