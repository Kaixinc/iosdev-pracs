//
//  DetailViewController.swift
//  QuizApp
//
//  Created by Kuiduan Zeng on 11/25/20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var quizTitle: UILabel!
    @IBOutlet weak var question1: UILabel!
    
    @IBOutlet weak var question2: UILabel!
    
    @IBOutlet weak var question3: UILabel!
    
    var quizName: String = ""
    var questionText1: String = ""
    var questionText2: String = ""
    var questionText3: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizTitle.text = quizName
        question1.text = questionText1
        question2.text = questionText2
        question3.text = questionText3
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
