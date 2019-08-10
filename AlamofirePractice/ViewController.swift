//
//  ViewController.swift
//  AlamofirePractice
//
//  Created by 黃威愷 on 2018/7/29.
//  Copyright © 2018年 黃威愷. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet var TextData:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://api.coindesk.com/v1/bpi/currentprice.json").responseJSON { (response) in
            print(response)
            if let bitcoinJSON = response.result.value{
                let bpiJSON:Dictionary = bitcoinJSON as! Dictionary<String,Any>
                let usdJSON:Dictionary = bpiJSON ["bpi"] as! Dictionary<String,Any>
                let ratefloat:Dictionary = usdJSON["USD"] as! Dictionary<String,Any>
                let rate:NSNumber = ratefloat["rate_float"] as! NSNumber
                let temp:Double = Double(truncating: rate)
                self.TextData.text = "$\(temp)"
            }
        }
        
    }
        // Do any additional setup after loading the view, typically from a nib.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



