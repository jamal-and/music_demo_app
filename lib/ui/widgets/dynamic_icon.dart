import 'package:flutter/cupertino.dart';
import 'package:music_app/ui/widgets/csvg.dart';

class DynamicIcon extends StatelessWidget {
  const DynamicIcon({
    super.key,
    required this.icon,
    this.color,
  });
  final dynamic icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return const SizedBox();
    }
    return icon is Widget
        ? icon
        : icon is IconData
            ? Icon(
                icon,
                color: color,
              )
            : MySvg(icon, color: color);
  }
}
