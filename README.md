# count_down_timer

------
A new Flutter  countdown project that can be used to send SMS verification code scenarios


------

## How to Use

```python
# add this line to your dependencies
count_down_timer: ^0.0.5
```

```python
import 'package:count_down_timer/count_down_timer.dart';

```

```python
CountDownWidget(
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

| property        | description    | defaultValue
| :--------   | :-----  |:--------
| startSeconds     | int    | 60
| onTapCallback        | Function （timer） |
| enableTS        | TextStyle ： clickable TextStyle|TextStyle(color: const Color(0xff000000)) |
| disableTS        | TextStyle ： unclickable TextStyle  |TextStyle(fontSize: 16, color: const Color(0xff999999)) |
| verifyStr        | String   |
| language        | CountDown.EN or CountDown.ZH |


###  [GitHub](https://github.com/manburenshenglu/count_down_widget)



