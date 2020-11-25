//
//  ViewController.swift
//  kc_autolayout
//
//  Created by 夕玦总攻拯救世界 on 11/24/20.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UIImage(named: "0a9386fff584a03a92d5b279ab815eee-1.jpg" )
        let imageView = UIImageView(image: img)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        
        let userlbl = UILabel.init()
        userlbl.backgroundColor = .yellow
        userlbl.text = "username"
        userlbl.translatesAutoresizingMaskIntoConstraints = false
        
        let passlbl = UILabel.init()
        passlbl.backgroundColor = .green
        passlbl.text = "password"
        passlbl.translatesAutoresizingMaskIntoConstraints = false
        
        let usertxt = UITextField.init()
        usertxt.backgroundColor = .yellow
        usertxt.translatesAutoresizingMaskIntoConstraints = false
        
        let passtxt = UITextField.init()
        passtxt.backgroundColor = .green
        passtxt.translatesAutoresizingMaskIntoConstraints = false
        
        let forgetbut = UIButton.init()
        forgetbut.backgroundColor = .red
        forgetbut.setTitle("forget password?", for: .normal)
        forgetbut.addTarget(self, action: #selector(Goanotherpage), for: .touchUpInside)
        forgetbut.translatesAutoresizingMaskIntoConstraints = false
        
        let submitbut = UIButton.init()
        submitbut.backgroundColor = .blue
        submitbut.setTitle("login", for: .normal)
        submitbut.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(userlbl)
        view.addSubview(passlbl)
        view.addSubview(usertxt)
        view.addSubview(passtxt)
        view.addSubview(forgetbut)
        view.addSubview(submitbut)
        
        let topimageview = NSLayoutConstraint.init(item: imageView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 50)
        
        let centerximageview = NSLayoutConstraint.init(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
        
        let leadinguserlbl = NSLayoutConstraint.init(item: userlbl, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 30)
        
        let topuserlbl = NSLayoutConstraint.init(item: userlbl, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1.0, constant: 100)
        
        let leadingpasslbl = NSLayoutConstraint.init(item: passlbl, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 30)
        
        let toppasslbl = NSLayoutConstraint.init(item: passlbl, attribute: .top, relatedBy: .equal, toItem: userlbl, attribute: .bottom, multiplier: 1.0, constant: 20)
        
        let leadingusertxt = NSLayoutConstraint.init(item: usertxt, attribute: .leading, relatedBy: .equal, toItem: userlbl, attribute: .trailing, multiplier: 1.0, constant: 100)
        
        let topusertxt = NSLayoutConstraint.init(item: usertxt, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1.0, constant: 100)
        
        let leadingpasstxt = NSLayoutConstraint.init(item: passtxt, attribute: .leading, relatedBy: .equal, toItem: passlbl, attribute: .trailing, multiplier: 1.0, constant: 100)
        
        let toppasstxt = NSLayoutConstraint.init(item: passtxt, attribute: .top, relatedBy: .equal, toItem: usertxt, attribute: .bottom, multiplier: 1.0, constant: 20)
        
        let leadingforgetbut = NSLayoutConstraint.init(item: forgetbut, attribute: .leading, relatedBy: .equal, toItem: passlbl, attribute: .leading, multiplier: 1.0, constant: 0)
        
        let topforgebut = NSLayoutConstraint.init(item: forgetbut, attribute: .top, relatedBy: .equal, toItem: passtxt, attribute: .bottom, multiplier: 1.0, constant: 100)
        
        let leadingsubmittbut = NSLayoutConstraint.init(item: submitbut, attribute: .leading, relatedBy: .equal, toItem: forgetbut, attribute: .trailing, multiplier: 1.0, constant: 100)
        
        let topsubmitbut = NSLayoutConstraint.init(item: submitbut, attribute: .top, relatedBy: .equal, toItem: forgetbut, attribute: .top, multiplier: 1.0, constant: 0)
        
        view.addConstraints([topimageview,centerximageview])
        view.addConstraints([leadinguserlbl,topuserlbl])
        view.addConstraints([leadingpasslbl,toppasslbl])
        view.addConstraints([leadingusertxt,topusertxt])
        view.addConstraints([leadingpasstxt,toppasstxt])
        view.addConstraints([leadingforgetbut,topforgebut])
        view.addConstraints([leadingsubmittbut,topsubmitbut])
        
        
    }
    
    @objc func Goanotherpage(_ sender: Any){
        let board = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = board.instantiateViewController(withIdentifier: "BViewController") as? BViewController
        guard let unwrappedvc = vc else{return}
        navigationController?.pushViewController(unwrappedvc, animated: true)
        
        
    }
}
