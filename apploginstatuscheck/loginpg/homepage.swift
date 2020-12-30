//
//  homepage.swift
//  loginpg
//
//  Created by Kaixin Chen on 12/3/20.
//

import UIKit

class homepage: UIViewController {
    
    @objc func signupsubmit(_ sender: UIButton){
        UserDefaults.standard.setValue(false, forKey: "Loginstatus")
        let board = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = board.instantiateViewController(withIdentifier: "ViewController")
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let SubmitButtom = UIButton.init()
        SubmitButtom.backgroundColor = UIColor.orange
        SubmitButtom.setTitle("Log out", for: .normal)
        SubmitButtom.translatesAutoresizingMaskIntoConstraints = false
        SubmitButtom.addTarget(self, action: #selector(signupsubmit(_:)), for: .touchUpInside)
        
        view.addSubview(SubmitButtom)
        let horizontConstraint = NSLayoutConstraint.init(item: SubmitButtom, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -100)
        let verticalConstraint = NSLayoutConstraint.init(item: SubmitButtom, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 50)
        let verticalConstraint2 = NSLayoutConstraint.init(item: SubmitButtom, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -50)
        view.addConstraints([verticalConstraint,verticalConstraint2,horizontConstraint])

        // Do any additional setup after loading the view.
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
