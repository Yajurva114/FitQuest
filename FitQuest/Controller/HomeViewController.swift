//
//  HomeViewController.swift
//  FitQuest
//
//  Created by yajurva shrotriya on 3/5/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var calorieCount: UILabel!
    
    @IBOutlet weak var fitRank: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var leaderboardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nameVar = "\(UserDefaults.standard.value(forKey: "Name") as! String)"
        name.text = nameVar
        name.textColor = .white
        
        playButton.layer.borderColor = UIColor.systemTeal.cgColor
        playButton.layer.borderWidth = 2
        playButton.titleLabel?.font = UIFont(name: "Futura", size: 21)
        playButton.titleLabel?.textColor = UIColor.white
    playButton.backgroundColor = UIColor.systemTeal
        playButton.layer.cornerRadius = 25


        leaderboardButton.layer.borderColor = UIColor.systemTeal.cgColor
        leaderboardButton.layer.borderWidth = 2
        leaderboardButton.titleLabel?.font = UIFont(name: "Futura", size: 21)
        leaderboardButton.titleLabel?.textColor = UIColor.white
        leaderboardButton.backgroundColor = UIColor.systemTeal
        leaderboardButton.layer.cornerRadius = 25
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        calorieCount.text = "Calories Burnt Today:  \(UserDefaults.standard.value(forKey: "calories") ?? 0)"
        
        if (UserDefaults.standard.value(forKey: "calories")) as! Int != 0{
            let rank = 1202 - ((UserDefaults.standard.value(forKey: "calories")) as! Int * 16)
            fitRank.text = "Local FitRank: \(rank)"
        }else{
            fitRank.text = "Local FitRank: 1202"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func playGame(_ sender: Any) {
       
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        vc2.modalPresentationStyle = .fullScreen
//        vc.modalPresentationStyle = .fullScreen
        
        present(vc2, animated: false)
        //present(vc, animated: false)
        
        let dif = UserDefaults.standard.value(forKey: "userExperience") as! Int
        
        var variable: Double!
        if(dif == 0){
            variable = 25.0
        } else if(dif == 1){
            variable = 30.0
        } else if(dif == 2){
            variable = 35.0
        } else{
            variable = 40.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + variable) {
            
            var newScore = UserDefaults.standard.value(forKey: "calories") as! Double + (vc2.jumpPoints * 0.2)
            UserDefaults.standard.setValue(newScore, forKey: "calories")
            
            vc2.dismiss(animated: true, completion: nil)
            }
    }
    
    @IBAction func displayLeaderboard(_ sender: Any) {
        
        let alert = UIAlertController(title: "Leaderboard not Available", message: "Leaderboard couldnt be loaded due to high volume usage", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Bet", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
