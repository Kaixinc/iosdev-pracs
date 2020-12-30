//
//  ViewController.swift
//  MVVMExample
//
//  Created by Alok Upadhyay on 07/12/20.
//  Copyright © 2020 Alok Upadhyay. All rights reserved.
//

//mvvm
//m = model/data layer
//class Person {name, age}


//v/viewcontroller/presentation layer = view // view interaction like click/type, rotation
//vm = viewmodel //logic = business logic/business layer 'GM + name'
import UIKit

let url = "https://api.github.com/search/users?q=a&page=1&per_page=20"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBAction func refresh(_ sender: UIButton) {
        let endpage = numberpage.text
        let url = "https://api.github.com/search/users?q=a&page=1&per_page=\(endpage ?? String(20))"
        VM.getDataFromViewModel(urlString: url, completion: { (data) in
            guard let model = data else {return}
            self.arr = model
            DispatchQueue.main.async {
                self.arr = model
                self.tblview.reloadData()
            }
        })
    }
    @IBOutlet weak var numberpage: UITextField!
    @IBOutlet weak var tblview: UITableView!
    @IBOutlet weak var lblLoader: UILabel!
    var arr = Datas.init(total_count: nil, incomplete_results: nil, items: nil)
    let VM = ItemViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblview.delegate = self
        tblview.dataSource = self
        VM.getDataFromViewModel(urlString: url, completion: { (data) in
            guard let model = data else {return}
            DispatchQueue.main.async {
                self.arr = model
                self.tblview.reloadData()
            }
        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.items?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if tableView == tblview{
            let content = arr.items?[indexPath.row].node_id
            cell?.textLabel?.text = content
        }
        return cell!
    }


}

