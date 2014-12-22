//
//  ViewController.swift
//  ScreenSwich
//
//  Created by 王 军 on 14/12/3.
//  Copyright (c) 2014年 王 军. All rights reserved.
//

import UIKit
import Snappy

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addPictureViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //添加页面 
    func addPictureViewController(){
        var pictureViewController=PictureViewController(nibName:"PictureViewController",bundle:NSBundle.mainBundle())
        self .addChildViewController(pictureViewController)
        self.view.addSubview(pictureViewController.view)
        
        pictureViewController.view.snp_makeConstraints { make in
            make.edges.equalTo(self.view).with.insets(UIEdgeInsetsZero)
            return
        }
    }
    
}