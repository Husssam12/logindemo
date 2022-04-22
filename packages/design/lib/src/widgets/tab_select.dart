import 'package:design/design.dart';
import 'package:flutter/material.dart';

class TabSelect<T> extends StatelessWidget {
  const TabSelect({
    Key? key,
    required this.items,
    this.onChanged,
    this.selectedItem,
    this.padding,
    this.indicatorPadding = EdgeInsets.zero,
    this.labelPadding,
    this.labelColor,
    this.unselectedLabelColor,
    this.tabHeight,
    this.indicatorColor,
  })  : assert(items.length != 0),
        super(key: key);

  final List<TabItem<T>> items;

  final ValueChanged<T>? onChanged;

  final T? selectedItem;

  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry indicatorPadding;

  final EdgeInsetsGeometry? labelPadding;

  final Color? labelColor;
  final Color? indicatorColor;

  final Color? unselectedLabelColor;
  final double? tabHeight;

  @override
  Widget build(BuildContext context) {
    final currentDirection = Directionality.of(context);
    final isRTL = currentDirection == TextDirection.rtl;
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;

    final selectedIndex = items.indexWhere((element) {
      return element.value == selectedItem;
    });
    final initialIndex = selectedIndex != -1 ? selectedIndex : 0;
    return DefaultTabController(
      length: items.length,
      initialIndex: initialIndex,
      child: Align(
        alignment: isRTL ? Alignment.centerRight : Alignment.centerLeft,
        child: TabBar(
          padding: padding,
          indicatorPadding: indicatorPadding,
          labelPadding: labelPadding,
          labelColor: labelColor ?? colorScheme.secondary,
          indicatorColor: indicatorColor ?? colorScheme.secondary,
          unselectedLabelColor: unselectedLabelColor ?? colorScheme.onSurface,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: items
              .map((e) => Tab(
                    height: tabHeight,
                    child: Text(
                      e.label,
                      style: themeData.textTheme.headline6
                          ?.copyWith(fontSize: 12.sp),
                    ),
                  ))
              .toList(),
          onTap: (index) {
            onChanged?.call(items[index].value);
          },
        ),
      ),
    );
  }
}

class TabItem<T> {
  final String label;
  final T value;

  TabItem({
    required this.label,
    required this.value,
  });
}
