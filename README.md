# count_down_timer

------
A new Flutter  countdown project that can be used to send SMS verification code scenarios


------

## How to Use

```python
# add this line to your dependencies
count_down_timer: ^0.0.1
```

```python
import 'package:count_down_timer/count_down_timer.dart';

```

```python
CountDownWidget(
        startSeconds: 60,
        onTapCallback: (timer) {
            print('onTapCallback：current is ${timer.tick}s');
        },
        enableTS:
            TextStyle(color: const Color(0xff00ff00)),
        disableTS:
            TextStyle(color: const Color(0xff999999)),
    )
```
### API

| property        | description
| :--------   | :-----  |
| startSeconds     | int    |
| onTapCallback        | Function （timer） |
| enableTS        | TextStyle ： clickable TextStyle|
| disableTS        | TextStyle ： unclickable TextStyle  |


###  [GitHub](https://github.com/manburenshenglu/count_down_widget)



