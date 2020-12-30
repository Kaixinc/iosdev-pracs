//
//  ViewController.swift
//  MVVMClosure
//
//  Created by Alok Upadhyay on 17/12/20.
//  Copyright © 2020 Alok Upadhyay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let vm = ToDoViewModel()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    func fetchData() {
        let str = "https://jsonplaceholder.typicode.com/todos/"
        let url = URL.init(string: str)
        guard let urlUnwrapped = url else { return  }

        
        vm.getDataFromApiHandler(url: urlUnwrapped) {
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let todo = vm.getItem(index: indexPath.row)
        cell?.textLabel?.text = vm.getAllInFoString(todo: todo!)
        return  cell!
    }
    
    


}

