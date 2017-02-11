//
//  ViewController.swift
//  DiDiDemo
//
//  Created by ben on 16/11/4.
//  Copyright © 2016年 张增强. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DIOpenSDKDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    //实现代理方法
    func pageClose() {
     print("用户关闭了滴滴")
    }
    
    @IBAction func btnDDTaxi(_ sender: UIButton) {
        DIOpenSDK.registerApp("test", secret: "test")
        let option = DIOpenSDKRegisterOptions()
        DIOpenSDK.showDDPage(self, animated: true, params: option, delegate: self)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

