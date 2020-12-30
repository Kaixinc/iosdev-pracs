//
//  ViewController.swift
//  loginpg
//
//  Created by Kaixin Chen on 12/3/20.
//

import UIKit

class ViewController: UIViewController {
    
    var views = [String: UIView]()
    var txtfields = [UITextField]()
    
    fileprivate func createTextFieldWithProperties(viewName: String, color: UIColor, text: String) {
        let txt = UITextField()
        views[viewName] = txt
        view.addSubview(txt)
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = color
        txt.placeholder = text
        txt.autocapitalizationType = .none
        txtfields.append(txt)
    }
    
    fileprivate func createUserName() {
        
        var metric = [String: Int]()
        metric["edge"] = 16
        metric["verticalInbetweenSpace"] = 200

        
        let viewName = "UserNameTxtField"
        createTextFieldWithProperties(viewName: viewName, color: UIColor.gray, text: "User Name")
        let hzConstraints = "H:|-edge-[\(viewName)]-edge-|"
        let verConstraints = "V:|-verticalInbetweenSpace-[\(viewName)]"
        addViewWithConstraints(hzConstraints: hzConstraints, verConstraints: verConstraints, metrics: metric)
    }
    
    fileprivate func createPassword(topView: String = "UserNameTxtField") {
        
        var metric = [String: Int]()
        metric["edge"] = 16
        metric["verticalInbetweenSpace"] = 50

        
        let viewName = "PasswordTxtField"
        createTextFieldWithProperties(viewName: viewName, color: UIColor.gray, text: "Password")
        let hzConstraints = "H:|-edge-[\(viewName)]-edge-|"
        let verConstraints = "V:[\(topView)]-verticalInbetweenSpace-[\(viewName)]"
        addViewWithConstraints(hzConstraints: hzConstraints, verConstraints: verConstraints, metrics: metric)
    }
    
    func addViewWithConstraints(hzConstraints: String, verConstraints: String, metrics: [String : Any]?) {
        let hzConstraints = NSLayoutConstraint.constraints(withVisualFormat: hzConstraints, options: [], metrics: metrics, views: views)
        let verConstraints = NSLayoutConstraint.constraints(withVisualFormat: verConstraints, options: [], metrics: metrics, views: views)
        view.addConstraints(hzConstraints)
        view.addConstraints(verConstraints)
    }
    
    @objc func signupsubmit(_ sender: UIButton){
        let username = views["UserNameTxtField"] as! UITextField
        let password = views["PasswordTxtField"] as! UITextField
        if ((username.text != "") && (password.text != "")){
            UserDefaults.standard.setValue(true, forKey: "Loginstatus")
            let board = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = board.instantiateViewController(withIdentifier: "homepage")
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        views["view"] = view
        self.view.backgroundColor = UIColor.black
        
        let SubmitButtom = UIButton.init()
        SubmitButtom.backgroundColor = UIColor.orange
        SubmitButtom.setTitle("Sign Up", for: .normal)
        SubmitButtom.translatesAutoresizingMaskIntoConstraints = false
        SubmitButtom.addTarget(self, action: #selector(signupsubmit(_:)), for: .touchUpInside)
        
        view.addSubview(SubmitButtom)
        
        let horizontConstraint = NSLayoutConstraint.init(item: SubmitButtom, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -100)
        let verticalConstraint = NSLayoutConstraint.init(item: SubmitButtom, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 50)
        let verticalConstraint2 = NSLayoutConstraint.init(item: SubmitButtom, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -50)
        view.addConstraints([verticalConstraint,verticalConstraint2,horizontConstraint])
        
        createUserName()
        createPassword()
        // Do any additional setup after loading the view.
    }
    


}

