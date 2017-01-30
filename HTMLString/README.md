# HTMLString

### Usage:
```swift
let myHTMLString = "A <font color="#06529E"><b>Lorem ipsum</font></b> dolor sit amet, consectetur adipiscing elit. Morbi at varius dui, in accumsan nisi."

let myLabel = UILabel()
myLabel.attributedText = myHTMLString.attributtedHTMLText(useColor: UIColor.white, useSize: 17)
