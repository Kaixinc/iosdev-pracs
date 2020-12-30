//
//  DetailViewController.swift
//  instrumentsExample
//
//  Created by Alok Upadhyay on 18/12/20.
//  Copyright © 2020 Alok Upadhyay. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var imgArray = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
let str = "https://images.pexels.com/photos/736230/pexels-photo-736230.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
        
        let url = URL.init(string: str)
        
        var urlr = URLRequest.init(url: url!)
        
        for _ in 0...1000 {
        URLSession.shared.dataTask(with: urlr) { (data, response, error) in
            let image = UIImage.init(data: data!)
            print(image)
            self.imgArray.append(image!)
        }.resume()
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

}
