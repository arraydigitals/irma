import 'package:flutter/widgets.dart';

class TextFieldListener extends Listener {
  const TextFieldListener({
    required super.child,
    super.key,
    super.behavior = HitTestBehavior.opaque,
  });
  @override
  PointerDownEventListener? get onPointerDown => (_) {
        if (FocusManager.instance.primaryFocus != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      };
}
