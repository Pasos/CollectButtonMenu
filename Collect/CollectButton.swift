//
//  CollectButton.swift
//  Collect
//
//  Created by パソス on 2015/11/17.
//  Copyright © 2015年 パソス. All rights reserved.
//

import Foundation
import UIKit

class CollectButton: HamburgerButton{
    
    var targets:[TargetButton] = [] //集めるボタン格納
    var collectstate:Bool = false   //集めているかの状態
    var near_distance:CGFloat = 40  //どれぐらい近くに配置するか
    
    override init(frame _frame:CGRect){
        super.init(frame: _frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //集めるボタングループに追加
    func add(button _button:UIButton) {
        targets.append(TargetButton(button: _button))
        //集めているなら再配置
        if collectstate {
            locate()
        }
    }
    
    //集めるボタングループから除外&元の位置に戻す
    func remove(button _button:UIButton){
        var i = 0
        for target in targets {
            if target.button == _button {
                targets.removeAtIndex(i)
                UIView.animateWithDuration(1, // アニメーションの時間
                    animations: {() -> Void  in
                        // アニメーションする処理
                        target.button.layer.position.x = target.origin_x
                        target.button.layer.position.y = target.origin_y
                })
            }
            i += 1
        }
        //集めているなら再配置
        if collectstate {
            locate()
        }
    }
    
    //グループに入っているボタンかどうか
    func is_exist(button _button:UIButton)-> Bool{
        for target in targets {
            if target.button == _button {
                return true
            }
        }
        return false
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if(collectstate){
            uncollect()
        }else{
            collect()
        }
        collectstate = !collectstate
        self.showsMenu = !self.showsMenu//★ハンバーガー継承の場合
    }
    
    //コレクトボタン近くにターゲットボタンを集める
    func collect(){
        //元の位置記録
        for target in targets {
            target.origin_x = target.button.layer.position.x
            target.origin_y = target.button.layer.position.y
        }
        //ボタン移動
        locate()
    }
    
    //元の座標に戻す
    func uncollect(){
        for target in targets {
            UIView.animateWithDuration(1, // アニメーションの時間
                animations: {() -> Void  in
                    // アニメーションする処理
                    target.button.layer.position.x = target.origin_x
                    target.button.layer.position.y = target.origin_y
            })
        }
    }
    
    //ボタンを集める
    func locate(){
        //配置方法を決める
        //let type = locate()
        
        let size = targets.count
        var i = 0
        for target in targets {
            UIView.animateWithDuration(1, // アニメーションの時間
                animations: {() -> Void  in
                    // アニメーションする処理
                    target.button.layer.position.x = self.layer.position.x + self.near_distance*CGFloat(cos(2*M_PI/Double(size)*Double(i) + M_PI))
                    target.button.layer.position.y = self.layer.position.y + self.near_distance*CGFloat(sin(2*M_PI/Double(size)*Double(i) + M_PI))
            })
            i += 1
        }
    }
    
    
    //コレクトボタンの位置によって配置の仕方のタイプを返す(未実装)
    func locatetype() -> Int {
        /*
        var position = 0
        if(self.frame.origin.x + self.frame.width > UIScreen.mainScreen().bounds.width*9/10){
        position = 0
        }else if(self.frame.origin.x < UIScreen.mainScreen().bounds.width/10 ){
        position = 1
        }else{
        position = 2
        }
        if(self.frame.origin.y + self.frame.height > UIScreen.mainScreen().bounds.height*9/10){
        position += 0
        }else if(self.frame.origin.y < UIScreen.mainScreen().bounds.height/10 ){
        position += 3
        }else{
        position += 6
        }
        */
        return 0
    }
}
/*
class TargetButton {
    
    var button:UIButton
    var origin_x:CGFloat
    var origin_y:CGFloat
    
    init(button _button:UIButton){
        button = _button
        origin_x = _button.layer.position.x
        origin_y = _button.layer.position.y
    }
    
}
*/