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

class ViewController: UIViewController, ItemViewModelProtocol {

    
    
    @IBOutlet weak var lblLoaderMvc: UILabel! //mvc
    
    @IBOutlet weak var lblLoader: UILabel!
    let itemViewModel = ItemViewModel.init()

    func didFinishGettingDataFromProvider() {
        //rfresg ur UI now
        //relaod table
       //stop loader or any progress thing
       print( itemViewModel.getError())
       print( itemViewModel.getItemAtIndex(index: 0)?.title)
        DispatchQueue.main.async {
            let item = self.itemViewModel.getItemAtIndex(index: 0)
                let title = self.itemViewModel.getTitleForItem(item: item)
                self.lblLoader.text = title
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }
    
    func fetchData() {
        lblLoader.text = "Please wait..."
        itemViewModel.itemViewModelProtocol = self
        itemViewModel.getDataFromDataProvider()
    }



}
