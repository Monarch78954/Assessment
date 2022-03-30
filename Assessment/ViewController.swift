//
//  ViewController.swift
//  Assessment
//
//  Created by Monarch Bhardwaj on 30/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initUI()
    }
    
    func initUI(){
        buttonOutlet.layer.borderColor = UIColor.black.cgColor
        buttonOutlet.layer.borderWidth = 1
        buttonOutlet.layer.cornerRadius = 5
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "UserDataVC", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "UserDataVC") as! UserDataVC
        self.present(vc, animated: true)
    }
}

