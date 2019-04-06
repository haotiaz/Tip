//
//  SettingsViewController.swift
//  Tips
//
//  Created by azht on 2019/3/23.
//  Copyright © 2019 azht. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var tip:Tip? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        percentage1.text=String(Int(tip!.tipPercentages[0]*100))
        percentage2.text=String(Int(tip!.tipPercentages[1]*100))
        percentage3.text=String(Int(tip!.tipPercentages[2]*100))
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = UserDefaults.standard

        defaults.set(tip?.tipPercentages, forKey: "percentages")
        defaults.synchronize()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tp=(defaults.array(forKey: "percentages"))
        if tp==nil {
            let p1=Int(tip!.tipPercentages[0]*100)
            self.percentage1.text=String(p1)
            let p2=Int(tip!.tipPercentages[1]*100)
            self.percentage2.text=String(p2)
            let p3=Int(tip!.tipPercentages[2]*100)
            self.percentage3.text=String(p3)
            
            
        }else{
            let p1=Int(((tp![0] as? Double)!)*100)
            self.percentage1.text=String(p1)
            let p2=Int(((tp![1] as? Double)!)*100)
            self.percentage2.text=String(p2)
            let p3=Int(((tp![2] as? Double)!)*100)
            self.percentage3.text=String(p3)
            
        }
    }
    
    
    
    @IBOutlet weak var percentage1: UITextField!
    @IBOutlet weak var percentage2: UITextField!
    @IBOutlet weak var percentage3: UITextField!
    
    @IBAction func editPercentage1(_ sender: Any) {
        let percent=Double(self.percentage1.text!) ?? 0.0
        tip!.tipPercentages[0]=percent/100
    }
    
    @IBAction func editPercentage2(_ sender: Any) {
        let percent=Double(self.percentage2.text!) ?? 0.0
        tip!.tipPercentages[1]=percent/100
    }
    
    
    @IBAction func editPercentage3(_ sender: Any) {
        let percent=Double(self.percentage3.text!) ?? 0.0
        tip!.tipPercentages[2]=percent/100
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
