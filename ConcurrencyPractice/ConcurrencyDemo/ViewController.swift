//
//  ViewController.swift
//  ConcurrencyDemo
//
//  Created by Hossam Ghareeb on 11/15/15.
//  Copyright © 2015 Hossam Ghareeb. All rights reserved.
//

import UIKit

let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                 "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                 "https://cloudfour.com/examples/img-currentsrc/images/kitten-large.png",
                 "https://www.imgonline.com.ua/examples/enlarged-photo.jpg"]

class Downloader {
    
    class func downloadImageWithURL(url:String) -> UIImage! {
        
        let urlini = URL.init(string: url)
        let data = try! Data(contentsOf: urlini!)
        return UIImage(data: data as Data)
    }
}


class ViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didclickOnStart(_ sender: Any) {
        
        let queue = DispatchQueue.global(qos: .default)
        
        queue.async {
            let img1 = Downloader.downloadImageWithURL(url: imageURLs[0])
            DispatchQueue.main.async {
                self.imageView1.image = img1
            }
        }
        
        queue.async {
            let img2 = Downloader.downloadImageWithURL(url: imageURLs[1])
            DispatchQueue.main.async {
                self.imageView2.image = img2
            }
        }
        
        queue.async {
            let img3 = Downloader.downloadImageWithURL(url: imageURLs[2])
            DispatchQueue.main.async {
                self.imageView3.image = img3
            }
        }
        
        queue.async {
            let img4 = Downloader.downloadImageWithURL(url: imageURLs[3])
            DispatchQueue.main.async {
                self.imageView4.image = img4
            }
        }
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        self.sliderValueLabel.text = "\(sender.value * 100.0)"
    }

}

