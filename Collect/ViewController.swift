//
//  ViewController.swift
//  Collect
//
//  Created by パソス on 2015/10/31.
//  Copyright © 2015年 パソス. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var collectBM1:CollectButtonMenu!
    var collectBM2:CollectButtonMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        roundedButton(button: b1Button)
        roundedButton(button: b2Button)
        roundedButton(button: b3Button)
        roundedButton(button: b4Button)
        roundedButton(button: b5Button)
        roundedButton(button: b6Button)
        
        collectBM1 = CollectButtonMenu(frame: CGRectMake(310, 600, 50, 50), color: UIColor.purpleColor(), viewcontroller: self)
        collectBM1.LOCATE_TYPE = CollectButtonMenu.locate_name.UpLeft
        collectBM1.NEAR_DISTANCE = 50
        collectBM1.add(button: b1Button, actiontype: UIControlEvents.TouchUpInside)
        collectBM1.add(button: b2Button, actiontype: UIControlEvents.TouchUpInside)
        collectBM1.add(button: b3Button, actiontype: UIControlEvents.TouchUpInside)
        self.view.addSubview(collectBM1)
        
        collectBM2 = CollectButtonMenu(frame: CGRectMake(310, 400, 50, 50), color: UIColor.redColor(), viewcontroller: self)
        collectBM2.LOCATE_TYPE = CollectButtonMenu.locate_name.Left
        collectBM2.NEAR_DISTANCE = 70
        collectBM2.add(button: b4Button, actiontype: UIControlEvents.TouchUpInside)
        collectBM2.add(button: b5Button, actiontype: UIControlEvents.TouchUpInside)
        collectBM2.add(button: b6Button, actiontype: UIControlEvents.TouchUpInside)
        self.view.addSubview(collectBM2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //タッチイベント
    @IBAction func RemoveButtonAction(sender: UIButton) {
        showNameLabel.text = sender.titleLabel?.text
    }
    
    //ボタンを丸くする関数
    func roundedButton(button _button :UIButton){
        _button.layer.cornerRadius = min(_button.layer.frame.width, _button.layer.frame.height)/2
        _button.layer.masksToBounds = true
    }
    
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var collectButton: UIButton!
    @IBOutlet weak var b1Button: UIButton!
    @IBOutlet weak var b2Button: UIButton!
    @IBOutlet weak var b3Button: UIButton!
    @IBOutlet weak var b4Button: UIButton!
    @IBOutlet weak var b5Button: UIButton!
    @IBOutlet weak var b6Button: UIButton!

}

