//
//  ViewController.swift
//  FYMessagePack
//
//  Created by 杨飞宇 on 2016/10/8.
//  Copyright © 2016年 FY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let str = MessagePackValue("杨飞宇");
        let data = pack(str)
        print("-------\(data)")
        
        let aa = try? unpack(data)
        print(aa)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

