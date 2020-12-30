//
//  ViewController.swift
//  CoreDataApp
//
//  Created by Ghufran Latif  on 12/16/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tblView: UITableView!
    var dataSourceArray = [Person]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchAndUpdateTable()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let person = dataSourceArray[indexPath.row]
            appDelegate.deleteRecord(person: person)
            fetchAndUpdateTable()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let person = dataSourceArray[indexPath.row]
        cell?.textLabel?.text = person.name! + " " + person.address!
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = dataSourceArray[indexPath.row]
        var nameTextField: UITextField?
        var addressTextField: UITextField?
        
        let dialogMessage = UIAlertController(title: "Update record", message: "Update name and address", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
            
            let name = nameTextField?.text
            let address = addressTextField?.text
            
            if name != nil && address != nil {
                //add the records
                self.appDelegate.updateRecord(person: person, name: name!, address: address!)
                self.fetchAndUpdateTable()
            }
            
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { (action)-> Void in
            print("Canceled")
        })
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        dialogMessage.addTextField { (textField) -> Void in
            nameTextField = textField
            nameTextField?.placeholder = "Type your name"
            nameTextField?.text = person.name
        }
        dialogMessage.addTextField { (textField) -> Void in
            addressTextField = textField
            addressTextField?.placeholder = "Type your address"
            addressTextField?.text = person.address
        }
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    func fetchAndUpdateTable(){
        dataSourceArray = appDelegate.fetchRecords()
        tblView.reloadData()
    }

    @IBAction func addRecord(_ sender: UIButton) {
        var nameTextField: UITextField?
        var addressTextField: UITextField?
        
        let dialogMessage = UIAlertController(title: "Add Record", message: "Provide name and address", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
            
            let name = nameTextField?.text
            let address = addressTextField?.text
            
            if name != nil && address != nil {
                //add the records
                self.appDelegate.insertRecord(name: name!, address: address!)
                self.fetchAndUpdateTable()
            }
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { (action)-> Void in
            print("Canceled")
        })
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        dialogMessage.addTextField { (textField) -> Void in
            nameTextField = textField
            nameTextField?.placeholder = "Type your name"
        }
        dialogMessage.addTextField { (textField) -> Void in
            addressTextField = textField
            addressTextField?.placeholder = "Type your address"
        }
        self.present(dialogMessage, animated: true, completion: nil)
    }
}

