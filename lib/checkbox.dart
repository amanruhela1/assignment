import 'package:flutter/material.dart';

class ItemCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const ItemCheckbox({
    required this.value,
    required this.onChanged,
  });

  @override
  _ItemCheckboxState createState() => _ItemCheckboxState();
}

class _ItemCheckboxState extends State<ItemCheckbox> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(covariant ItemCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _value,
      onChanged: (value) {
        setState(() {
          _value = value!;
          widget.onChanged!(value);
        });
      },
    );
  }
}