//
//  ViewController.swift
//  navigation
//
//  Created by SeungYeon Kim on 2021/08/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

class SecondViewController : UIViewController {
    @IBAction func movePop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        print("View2:: movePop ", navigationController == nil)
        // show를 이용한 화면 이동의 경우에는 pop으로
    }
    
    @IBAction func moveBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        print("View2:: moveBack ", presentingViewController == nil)
        //present modally를 이용한 화면 이동의 경우에는 dissmiss로
    }
}

class ThirdViewController : UIViewController {
    @IBAction func movePop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        print("View3:: movePop ", navigationController == nil)
    }
    
    @IBAction func moveBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        print("View3:: moveBack ", presentingViewController == nil)
    }
}

class FourthViewController : UIViewController {
    @IBAction func movePop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        print("View4:: movePop ", navigationController == nil)
    }
    
    @IBAction func moveBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        print("View4:: moveBack ", presentingViewController == nil)
    }
}
