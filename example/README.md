# count_down_timer

------
A new Flutter  countdown project that can be used to send SMS verification code scenarios


------

## How to Use

```python
# add this line to your dependencies
count_down_timer: ^1.0.1
```

```python
import 'package:count_down_timer/count_down_timer.dart';

```

```python
CountDownWidget(
        phone: _phone,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  width: 1,
                  color: Color(0xfff4f4f4),
                ),
              ),
        startSeconds: 6,
        onTapCallback: (timer) {
          print('onTapCallback：current is ${timer.tick}s');
        },
        language: CountDown.EN,
        verifyStr: "Send",
        enableTS: TextStyle(color: const Color(0xff000000)),
        disableTS: TextStyle(color: const Color(0xff999999)),
      )
```
### API

| property        | description  |defaultValue
| :--------   | :-----  |:-----
| startSeconds     | int    |60
| onTapCallback        | Function （timer） |
| enableTS        | TextStyle ： clickable TextStyle|TextStyle(color: const Color(0xff000000))
| disableTS        | TextStyle ： unclickable TextStyle  |TextStyle(fontSize: 16, color: const Color(0xff999999))
| verifyStr        | String  |
| language        | CountDown.EN or CountDown.ZH  |
| phone        | String: phone number which your input  |
| widgetWidth        | double  |
| decoration        | Decoration: decoration for container |
| padding        | EdgeInsetsGeometry: padding for container |

notes:when language=CountDown.ZH,other case ignore follow notes please！
当 language=CountDown.ZH 时，会自动判断输入的手机号是否合法
###  [https://pub.flutter-io.cn/packages/count_down_timer]



