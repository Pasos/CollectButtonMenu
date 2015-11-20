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
        roundedButton(buttons: [b1Button,b2Button,b3Button,b4Button,b5Button,b6Button])
        
        collectBM1 = CollectButtonMenu(frame: CGRectMake(310, 400, 50, 50), color: UIColor.redColor(), view_controller: self)
        collectBM1.LOCATE_TYPE = CollectButtonMenu.locate_name.Left
        collectBM1.NEAR_DISTANCE = 70
        collectBM1.add(button: b4Button, actiontype: [UIControlEvents.TouchUpInside])
        collectBM1.add(button: b5Button, actiontype: [UIControlEvents.TouchUpInside])
        collectBM1.add(button: b6Button, actiontype: [UIControlEvents.TouchUpInside])
        self.view.addSubview(collectBM1)
        
        collectBM2 = CollectButtonMenu(frame: CGRectMake(310, 600, 50, 50), color: UIColor.purpleColor(), view_controller: self)
        collectBM2.LOCATE_TYPE = CollectButtonMenu.locate_name.UpLeft
        collectBM2.NEAR_DISTANCE = 50
        collectBM2.add(button: b1Button, actiontype: [UIControlEvents.TouchDown, UIControlEvents.TouchUpInside])
        collectBM2.add(button: b2Button, actiontype: [UIControlEvents.TouchDown, UIControlEvents.TouchUpInside])
        collectBM2.add(button: b3Button, actiontype: [UIControlEvents.TouchDown, UIControlEvents.TouchUpInside])
        self.view.addSubview(collectBM2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //タッチイベント
    @IBAction func ButtonAction(sender: UIButton) {
        showNameLabel.text = sender.titleLabel?.text
    }
    
    @IBAction func ButtonTouchDown(sender: UIButton) {
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions(),                    animations: {() -> Void  in
                self.touchDownLabel.transform = CGAffineTransformMakeScale(1.3, 1.3)
            }
            ,completion: {(finished: Bool) -> Void in
                self.touchDownLabel.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }
        )
    }
    
    //ボタンを丸くする関数
    func roundedButton(buttons _buttons :[UIButton]){
        for _button in _buttons {
            _button.layer.cornerRadius = min(_button.layer.frame.width, _button.layer.frame.height)/2
            _button.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var touchDownLabel: UILabel!
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var collectButton: UIButton!
    @IBOutlet weak var b1Button: UIButton!
    @IBOutlet weak var b2Button: UIButton!
    @IBOutlet weak var b3Button: UIButton!
    @IBOutlet weak var b4Button: UIButton!
    @IBOutlet weak var b5Button: UIButton!
    @IBOutlet weak var b6Button: UIButton!

}

