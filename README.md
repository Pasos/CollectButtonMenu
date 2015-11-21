#CollectButtonMenu

CollectButtonMenu collect some grouped UIButton arround the CollectButtonMenu, if a user touch down the Button.
And if the user drag and touch up in the UIButton, TouchEvent for the UIButton occur.

A display use HumbergerButton

http://robb.is/working-on/a-hamburger-button-transition/

##Concept
In the Latest, iphone device gets bigger.
So, User can't touch the Button easily with one hand control.
I want to touch all button easily near a thumb.

##How to Use

###initialize
init(frame _frame:CGRect, color _color:UIColor, view_controller _view_controller:UIViewController )

- frame: Position of CollectButtonMenu

- color: BackGroundColor of CollectButtonMenu and grouped UIButtons when a user drag the UIButton.

- view_controller: UIViewController the CollectButtonMenu is located in.

###add a UIButton in the group
add(button _button:UIButton, actiontype _action_type:[UIControlEvents])

- button: a UIButton added in the group
- actiontype: a occured TouchEvent when the touch up inside the UIButton (multi TouchEvents avaiable.TouchEvents occur in order based on array)


###remove a UIButton from the group
remove(button _button:UIButton)

- button: a UIButton removed from the group

###Option

- BUTTON_COLOR:UIColor

  The BackGroundColor when a user drag a grouped UIButton

  initial value:UIColor.redColor()

- NEAR_DISTANCE:Int:

  A distance between CollectButtonMenu and grouped UIBUttons when the UIButtons are collected [pixel]

  initial value:50

- LOCATE_TYPE:locate_name
  
  a direction where UIButton locate

  initial value:locate_name.All
### locate_name
  locate_name.All
  
  locate_name.Up
  
  locate_name.Left
  
  locate_name.Right
  
  locate_name.Down
  
  locate_name.UpLeft
  
  locate_name.UpRight 
  
  locate_name.DownLeft
  
  locate_name.DownRight
