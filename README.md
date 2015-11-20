#CollectButtonMenu

コレクトボタンメニューをドラッグするとグループに入れたUIButtonがコレクトボタンメニューの周りに集まってきて
集まってきたボタンの上でドラッグを離すとそのUIButtonの任意のタッチイベントを起こせる、UIButon拡張ライブラリです。

今回はHumbergerButtonをオーバーライドして使っています。
http://robb.is/working-on/a-hamburger-button-transition/

##背景
iphone端末拡大の世の生で指で簡単に触れる位置でボタンをタッチしたいというニーズがあると思って作りました

##使い方

###初期化
init(frame _frame:CGRect, color _color:UIColor, viewcontroller _viewCon:UIViewController )
frame:配置場所の指定。
color:ドラッグ時に変わるボタンの背景色
viewcontroller:配置されているUIViewController

###グループにボタン追加
add(button _button:UIButton, actiontype _actiontype:UIControlEvents)
button:追加するボタン
actiontype:ドラッグを離した時に


###グループからボタン除外
remove(button :UIButton)

で集まるボタンのグループに追加できます。

###定数

-BUTTON_COLOR:UIColor
ドラッグ時に染める色
初期値:UIColor.redColor()
-LOCATE_TYPE:Int
UIButtonの集まる方向
["All":0, "Up":1, "Left":2, "Right":3, "Down":4, "UpLeft":5, "UpRight":6, "DownLeft":7, "DownRight":8]
初期値:0
-NEAR_DISTANCE:Int:
集まった時のUIBUttonとコレクトボタンメニューの距離[pixel]
初期値:50
