//
//  ViewController.swift
//  Tips
//
//  Created by azht on 2019/3/22.
//  Copyright © 2019 azht. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tp=(defaults.array(forKey: "percentages"))
        print(tips.tipPercentages)
        if tp==nil {
            self.tipPercentages.setTitle("\(Int(tips.tipPercentages[0]*100))%", forSegmentAt: 0)
            self.tipPercentages.setTitle("\(Int(tips.tipPercentages[1]*100))%", forSegmentAt: 1)
            self.tipPercentages.setTitle("\(Int(tips.tipPercentages[2]*100))%", forSegmentAt: 2)
        }else{
            self.tipPercentages.setTitle("\(Int(((tp![0] as? Double)!)*100))%", forSegmentAt: 0)
            self.tipPercentages.setTitle("\(Int(((tp![1] as? Double)!)*100))%", forSegmentAt: 1)
            self.tipPercentages.setTitle("\(Int(((tp![2] as? Double)!)*100))%", forSegmentAt: 2)
            
            tips.tipPercentages[0]=(tp![0] as? Double)!
            tips.tipPercentages[1]=(tp![1] as? Double)!
            tips.tipPercentages[2]=(tp![2] as? Double)!
            
        }
        
    }
    
    let tips=Tip()
    
    @IBOutlet weak var tipPercentages: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    

    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    

    @IBAction func calculateTip(_ sender: Any) {
        tips.setAmount(Double(billField.text!) ?? 0)
        let percentage=tips.tipPercentages[tipPercentages.selectedSegmentIndex]
        let tip=tips.getAmount()*percentage
        let total=tips.getAmount()+tip
        
        tipLabel.text=String(format:"$%.2f",tip)
        totalLabel.text=String(format:"$%.2f",total)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SettingsViewController{
            let vc=segue.destination as! SettingsViewController
            vc.tip=self.tips
            print("go to setting")
            
        }
    }
    
    
}

