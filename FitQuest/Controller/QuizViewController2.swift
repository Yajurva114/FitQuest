//
//  QuizViewController2.swift
//  FitQuest
//
//  Created by yajurva shrotriya on 3/5/23.
//

import UIKit

class QuizViewController2: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var questions : [String] = [
    "Lose weight", "Gain Muscle", "Body Recomp (Lose fat Build Muscle)", "Just here for fun!"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        let nib2 = UINib(nibName: "Quiz2TableViewCell", bundle: nil)
        self.tableView.register(nib2, forCellReuseIdentifier: "Quiz2TableViewCell")
        
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

extension QuizViewController2 : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Quiz2TableViewCell") as! Quiz2TableViewCell
        
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
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
