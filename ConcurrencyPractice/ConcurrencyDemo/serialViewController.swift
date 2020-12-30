//
//  serialViewController.swift
//  ConcurrencyDemo
//
//  Created by kaixin Chen on 12/21/20.
//  Copyright © 2020 Hossam Ghareeb. All rights reserved.
//

import UIKit

class serialViewController: UIViewController {

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
        
        let serialQueue = DispatchQueue(label: "com.appcoda.imagesQueue")
        
        serialQueue.async {
            let img1 = Downloader.downloadImageWithURL(url: imageURLs[0])
            DispatchQueue.main.async {
                self.imageView1.image = img1
            }
        }
        
        serialQueue.async {
            let img2 = Downloader.downloadImageWithURL(url: imageURLs[1])
            DispatchQueue.main.async {
                self.imageView2.image = img2
            }
        }
        
        serialQueue.async {
            let img3 = Downloader.downloadImageWithURL(url: imageURLs[2])
            DispatchQueue.main.async {
                self.imageView3.image = img3
            }
        }
        
        serialQueue.async {
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
