//
//  ViewController.swift
//  FistProject
//
//  Created by lishan on 2022/4/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showMessage(sender: UIButton) {
        let alterConrtoller = UIAlertController(title: "Welcome to my fist App", message: "更多", preferredStyle: UIAlertController.Style.alert)
        alterConrtoller.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alterConrtoller, animated: true, completion: nil)
    }
    
    @IBAction func anothershowMessage(sender: UIButton) {
        let alterConrtoller = UIAlertController(title: "Welcome to my second App", message: "no more", preferredStyle: UIAlertController.Style.alert)
        alterConrtoller.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alterConrtoller, animated: true, completion: nil)
    }
    
    @IBAction func othershowMessage(sender: UIButton) {
        let alterConrtoller = UIAlertController(title: "Welcome to my second App", message: "no more", preferredStyle: UIAlertController.Style.alert)
        alterConrtoller.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alterConrtoller, animated: true, completion: nil)
    }
    
    @IBAction func theothershowMessage(sender: UIButton) {
        let alterConrtoller = UIAlertController(title: "Welcome to my second App", message: "no more", preferredStyle: UIAlertController.Style.alert)
        alterConrtoller.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alterConrtoller, animated: true, completion: nil)
    }
}

