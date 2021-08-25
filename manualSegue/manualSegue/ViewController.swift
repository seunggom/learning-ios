//
//  ViewController.swift
//  manualSegue
//
//  Created by SeungYeon Kim on 2021/08/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var paramNameBox: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var mySwitch: UISwitch!
    
    override func viewDidLoad() {
        let list = ["하나", "둘", "셋"]
        segmentedControl.removeAllSegments()
        for li in list {
            print(segmentedControl.numberOfSegments)
            segmentedControl.insertSegment(withTitle: li, at: segmentedControl.numberOfSegments, animated:true)
        }
        
    }
    
    @IBAction func onClick(_ sender: Any) {
        let secondVC = self.storyboard?.instantiateViewController(identifier: "secVc") as? SecondController
        
        print(paramNameBox.text!)
        let selectedIndex = segmentedControl.selectedSegmentIndex
        secondVC?.segment = selectedIndex == -1 ? "not selected" : segmentedControl.titleForSegment(at: selectedIndex)
        secondVC?.paramName = paramNameBox.text!
        secondVC?.sliderValue = slider.value
        secondVC?.switchOn = mySwitch.isOn
        
        self.present(secondVC!, animated: true)
    }
    
    @IBAction func switched(_ sender: Any) {
        if (!mySwitch.isOn) {
            segmentedControl.selectedSegmentIndex = -1
        }
    }
    
//    @IBAction func moveSegue2(_ sender: Any) {
////     segue에 아이디를 설정해서 수행시키는 방법
//        self.performSegue(withIdentifier: "mSegue2", sender: self)
//    }
//
//    @IBAction func moveSegue(_ sender: Any) {
////        self.performSegue(withIdentifier: "mSegue", sender: self)
//
//    }
    
    
    @IBAction func moveNonSegue2(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(identifier: "thirdVc")
        nextVC?.modalTransitionStyle = .coverVertical
        
        self.present(nextVC!, animated: true, completion: {print("move to third view controller")})
    }
    
    @IBAction func moveNonSegue3(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(identifier: "fourthVc")
        nextVC?.modalTransitionStyle = .coverVertical
        
        self.present(nextVC!, animated: true, completion: {print("move to fourth view controller")})
    }
    
}

class SecondController: UIViewController {
    var segment: String?
    var paramName: String?
    var sliderValue: Float
    var switchOn: Bool
    
    @IBOutlet weak var result: UILabel!

    required init?(coder: NSCoder) {
        self.sliderValue = 1.0
        self.switchOn = true
        
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        result.text = """
            TextField: \(paramName ?? "")
            slider: \(sliderValue)
            segmentedControl Value: \(segment ?? "")
            """
        print(sliderValue)
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("deinit~~")
    }
}

class ThirdController: UIViewController {
    
}

class FourthController: UIViewController {
    
}
