//
//  ViewController.swift
//  QuizApp
//
//  Created by Kuiduan Zeng on 11/25/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var quizArray = [Quiz]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let quiz1 = Quiz(name: "Quiz1", questions: ["What's the weather today?", "How many pets do you have?", "What's your first car?"])
        
        let quiz2 = Quiz(name: "Quiz2", questions: ["What do you like to do in weekend?", "What's your favorite movie?", "Who's your idol?"])
        
        let quiz3 = Quiz(name: "Quiz3", questions: ["How to protect yourself from Covid-19?", "What's your favorite car?", "Where do you travel last year?"])
        
        quizArray.append(quiz1)
        quizArray.append(quiz2)
        quizArray.append(quiz3)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let board = UIStoryboard(name: "Main", bundle: nil)
        
        let detailVC: DetailViewController = board.instantiateViewController(identifier: "DetailViewController")
        
        detailVC.quizName = quizArray[indexPath.row].name
        
        detailVC.questionText1 = quizArray[indexPath.row].questions[0]
        
        detailVC.questionText2 = quizArray[indexPath.row].questions[1]
        
        detailVC.questionText3 = quizArray[indexPath.row].questions[2]
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My Quiz"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quizCell", for: indexPath)
        
        cell.textLabel?.text = quizArray[indexPath.row].name
        
        return cell
    }
    
    struct Quiz {
        var name: String
        var questions: [String] = []
    }
}

