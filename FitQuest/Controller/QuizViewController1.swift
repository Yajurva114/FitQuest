//
//  QuizViewController1.swift
//  FitQuest
//
//  Created by yajurva shrotriya on 3/5/23.
//

import UIKit

class QuizViewController1: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var questions: [String] = [
        "I dont work out!","1-2 times a week","3-4 times a week", "5-6 times a week"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "Quiz1TableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "Quiz1TableViewCell")
       
        
        // Do any additional setup after loading the view.
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
extension QuizViewController1 : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Quiz1TableViewCell") as! Quiz1TableViewCell
        
        cell.mainView.layer.borderColor = UIColor.systemTeal.cgColor
        cell.label.text = questions[indexPath.row]
        cell.mainView.layer.cornerRadius = 10
        cell.mainView.backgroundColor = UIColor.systemTeal
        
        cell.mainView.frame = CGRectOffset(cell.frame, 10, 10);
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        UserDefaults.standard.set(indexPath.row, forKey: "userExperience")
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "QuizViewController2") as! QuizViewController2
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
