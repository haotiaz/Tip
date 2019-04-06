//
//  Tips.swift
//  Tips
//
//  Created by azht on 2019/3/22.
//  Copyright © 2019 azht. All rights reserved.
//

import Foundation

class Tip {
    private var amount: Double?
    
    var tipPercentages=[0.1,0.15,0.20]
    
    func getAmount()->Double{
        return self.amount ?? 0.0
    }
    
    func setAmount(_ amount:Double){
        self.amount=amount
    }
    
}
