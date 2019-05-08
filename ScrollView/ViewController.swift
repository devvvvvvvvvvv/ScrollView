//
//  ViewController.swift
//  ScrollView
//
//  Created by Devon Dodgson on 5/8/19.
//  Copyright © 2019 Devon Dodgson. All rights reserved.
//

import UIKit

class ScrollViewController : UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var vc1 = FirstViewController?
    var vc2 = SecondViewController?
    var vc3 = ThirdViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        if let vc1 = storyboard.instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController {
            self.addChild(vc1)
            self.scrollView.addSubview(vc1.view)
            self.spaceVC = vc1
        }
        
        if let vc2 = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            self.addChild(vc2)
            self.scrollView.addSubview(vc2.view)
            self.fairyVC = vc2
        }
        
        if let vc3 = storyboard.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController {
            self.addChild(vc3)
            self.scrollView.addSubview(vc3.view)
            self.oceanVC = vc3
        }
        
        self.scrollView.isPagingEnabled = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.scrollView.frame = self.view.bounds
        self.spaceVC?.view.frame = self.scrollView.bounds
        
        self.fairyVC?.view.frame = CGRect(x: 0,
                                          y: self.scrollView.bounds.height,
                                          width: self.view.frame.size.width,
                                          height: self.view.frame.size.height)
        
        self.oceanVC?.view.frame = CGRect(x: 0,
                                          y: self.scrollView.bounds.height * 2,
                                          width: self.view.frame.size.width,
                                          height: self.view.frame.size.height * 2)
        
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width,
                                             height: self.view.frame.height * 3)
    }
}

