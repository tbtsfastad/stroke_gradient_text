**Preview**

![](https://github.com/tbtsfastad/stroke_gradient_text/blob/master/Screenshot_20250630_213153.png)

**How to use**

Import

```         
import 'package:stroke_gradient_text/stroke_gradient_text.dart';
```

Example

```         
import 'package:flutter/material.dart';
import 'package:stroke_gradient_text/stroke_gradient_text.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) => StrokeAndGradientText(
        strokeColor: Colors.red,
        strokeWidth: 2,
        gradient: LinearGradient(colors: [Colors.green, Colors.white]),
        child: Text("data"),
      );
}
```
