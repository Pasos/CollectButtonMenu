#CollectButtonMenu

コレクトボタンメニューをドラッグするとグループに入れたUIButtonがコレクトボタンメニューの周りに集まってきて

集まってきたボタンの上でドラッグを離すとそのUIButtonの任意のタッチイベントを起こせる、UIButon拡張ライブラリです。

今回はHumbergerButtonを拡張してオーバーライドして使っています。

http://robb.is/working-on/a-hamburger-button-transition/

##背景
iphone端末拡大の世の生で指で簡単に触れる位置でボタンをタッチしたいというニーズがあると思って作りました

##使い方

###初期化
init(frame _frame:CGRect, color _color:UIColor, viewcontroller _viewCon:UIViewController )

- frame:配置場所の指定。

- color:ドラッグ時に変わるボタンの背景色

- viewcontroller:配置されているUIViewController

###グループにボタン追加
add(button _button:UIButton, actiontype _actiontype:UIControlEvents)

- button:追加するボタン
- actiontype:ドラッグを離した時に起こすイベントの種類


###グループからボタン除外
remove(button :UIButton)

- button:除外するボタン

###指定オプション

- BUTTON_COLOR:UIColor

  ドラッグ時に染める色

  初期値:UIColor.redColor()

- NEAR_DISTANCE:Int:

  集まった時のUIBUttonとコレクトボタンメニューの距離[pixel]

  初期値:50

- LOCATE_TYPE:locate_name
  
  UIButtonの集まる方向

  初期値:locate_name.All
### 定数
  locate_name.All
  locate_name.Up
  locate_name.Left
  locate_name.Right
  locate_name.Down
  locate_name.UpLeft
  locate_name.UpRight
  locate_name.DownLeft
  locate_name.DownRight
