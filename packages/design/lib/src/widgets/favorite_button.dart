import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteButton extends StatefulWidget {
  final bool initValue;
  final Color? favorColor;
  final Color? color;
  final double size;
  final IconData? favorIcon;
  final IconData? icon;

  final Function(bool)? onChange;

  const FavoriteButton({
    Key? key,
    required this.initValue,
    this.onChange,
    this.favorColor,
    this.color,
    this.size = 32,
    this.favorIcon,
    this.icon,
  }) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool _favor;

  @override
  void initState() {
    _favor = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return RawMaterialButton(
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () {
        _favor = !_favor;
        widget.onChange?.call(_favor);
        setState(() {});
      },
      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      shape: const CircleBorder(),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        child: Icon(
          _favor
              ? widget.favorIcon ?? Icons.favorite
              : widget.icon ?? Icons.favorite_border_outlined,
          size: widget.size.r,
          color: _favor
              ? widget.favorColor ?? themeData.colorScheme.secondary
              : widget.color ?? Colors.white,
          key: Key(_favor.toString()),
        ),
      ),
    );
  }
}
