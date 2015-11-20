//
//  CollectButton.swift
//  Collect
//
//  Created by パソス on 2015/11/17.
//  Copyright © 2015年 パソス. All rights reserved.
//

import Foundation
import UIKit

public class CollectButtonMenu: HamburgerButton{
    
    var targets:[TargetButton] = []                     //集めるボタン格納
    var collect_state:Bool = false                       //集めているかの状態
    var view_con:UIViewController! = nil                 //親のViewController格納
    enum locate_name {                                  //配置タイプ名
        case All
        case Up
        case Left
        case Right
        case Down
        case UpLeft
        case UpRight
        case DownLeft
        case DownRight
    }
    
    var NEAR_DISTANCE:CGFloat = 40                      //どれぐらい近くに配置するか
    var BUTTON_COLOR:UIColor = UIColor.redColor()       //ドラッグ時に染める色
    var LOCATE_TYPE: locate_name = locate_name.All      //配置するタイプ
    
    init(frame _frame:CGRect, color _color:UIColor, viewcontroller _viewCon:UIViewController ){
        super.init(frame: _frame, color: _color)
        BUTTON_COLOR = _color
        view_con = _viewCon
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //集めるボタングループに追加
    func add(button _button:UIButton, actiontype _actiontype:UIControlEvents) {
        targets.append(TargetButton(button: _button))
    }
    
    //集めるボタングループから除外
    func remove(button _button:UIButton){
        var i = 0
        for target in targets {
            if target.button == _button {
                targets.removeAtIndex(i)
            }
            i += 1
        }
    }
    
    //グループに入っているボタンかどうか指定
    func is_exist(button _button:UIButton)-> Bool{
        for target in targets {
            if target.button == _button {
                return true
            }
        }
        return false
    }
    
    //☆タッチイベント
    
    //ドラッグ開始
    override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        collect()
        collect_state = true
        self.showsMenu = !self.showsMenu//★ハンバーガー継承の場合
    }
    
    //ドラッグ終了
    override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        //ボタンのタッチ関数呼び出し
        
        //タッチ位置取得
        let aTouch = touches.first
        let location = aTouch!.locationInView(view_con.view)
        
        for target in targets {
            if(target.button.frame.contains(location)){
                target.button.sendActionsForControlEvents(.TouchUpInside)//
                UIView.animateWithDuration(0.3, delay: 0.8, options: UIViewAnimationOptions(),                    animations: {() -> Void  in
                        target.button.transform = CGAffineTransformMakeScale(1, 1);
                        target.button.backgroundColor = target.origin_color
                    }
                    ,completion: {(finished: Bool) -> Void in
                    }
                )
            }
        }
        //ボタンを元の位置に戻す。
        uncollect()
        collect_state = false
        self.showsMenu = !self.showsMenu//★ハンバーガー継承の場合
    }
    
    //ドラッグ移動
    override public func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // タッチイベントを取得.
        let aTouch = touches.first
        // 移動した先の座標を取得.
        let location = aTouch!.locationInView(view_con.view)

        for target in targets {
            if(target.button.frame.contains(location)){
                //ドラッグ中のボタン
                UIView.animateWithDuration(0.3,
                    animations: {() -> Void  in
                        target.button.transform = CGAffineTransformMakeScale(1.3, 1.3);
                        target.button.backgroundColor = self.BUTTON_COLOR
                })
            }else{
                //それ以外ののボタン
                UIView.animateWithDuration(0.3,
                    animations: {() -> Void  in
                        target.button.transform = CGAffineTransformMakeScale(1, 1);
                        target.button.backgroundColor = target.origin_color
                })
            }
        }
        
    }
    
    
    //コレクトボタン近くにターゲットボタンを集める
    func collect(){
        //ボタンの元の位置記録
        for target in targets {
            target.origin_x = target.button.layer.position.x
            target.origin_y = target.button.layer.position.y
            if let color = target.button.backgroundColor {
                target.origin_color = color
            }else{
                target.origin_color = UIColor.clearColor()
            }
        }
        //ボタン移動
        var i = 0
        for target in targets {
            UIView.animateWithDuration(0.8,
                animations: {() -> Void  in
                    target.button.layer.position.x = self.layer.position.x + self.NEAR_DISTANCE*CGFloat(cos(self.locateangle(i)))
                    target.button.layer.position.y = self.layer.position.y + self.NEAR_DISTANCE*CGFloat(sin(self.locateangle(i)))
            })
            i += 1
        }
    }
    
    //ボタンを元の座標に戻す
    func uncollect(){
        for target in targets {
            UIView.animateWithDuration(0.8,
                animations: {() -> Void  in
                    target.button.layer.position.x = target.origin_x
                    target.button.layer.position.y = target.origin_y
            })
        }
    }
    
    //配置する方向の決定
    func locateangle(i:Int) -> Double{
        var direction:Double = 0
        if(LOCATE_TYPE == locate_name.All){
            direction = 2*M_PI/Double(targets.count)*Double(i)
        }else{
            if(targets.count != 1){
                direction = 2*M_PI/Double(targets.count-1)*Double(i)
            }else{
                direction = 2*M_PI/Double(targets.count+1)*Double(i+1)
            }
        }
        //配置タイプによって処理
        switch LOCATE_TYPE {
            case locate_name.Up ://Up
                direction = direction/2 + M_PI
            case locate_name.Left://Left
                direction = direction/2 + M_PI/2
            case locate_name.Right://Right
                direction = direction/2 + M_PI*1.5
                if(direction > M_PI*2){
                    direction -= M_PI*2
                }
            case locate_name.Down://Down
                direction = direction/2
            case locate_name.UpLeft://UpLeft
                direction = direction/4 + M_PI
            case locate_name.UpRight://UpRight
                direction = direction/4 + M_PI*1.5
            case locate_name.DownLeft://DownLeft
                direction = direction/4 + M_PI/2
            case locate_name.DownRight://DownRight
                direction = direction/4
        default:
            break
        }
        return direction
    }
}

class TargetButton {
    
    var button:UIButton     //ボタン本体
    var origin_x:CGFloat    //元のx座標
    var origin_y:CGFloat    //元のy座標
    var origin_color:UIColor//元の背景色
    
    init(button _button:UIButton){
        button = _button
        origin_x = _button.layer.position.x
        origin_y = _button.layer.position.y
        if let color = _button.backgroundColor {
            origin_color = color
        }else{
            origin_color = UIColor.clearColor()
        }
    }
    
}