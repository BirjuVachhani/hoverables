// Copyright © 2024 Birju Vachhani. All rights reserved.
// Use of this source code is governed by a BSD 3-Clause License that can be
// found in the LICENSE file.

// Author: Birju Vachhani
// Created Date: November 01, 2024

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// Builder function type for [HoverBuilder] where [hovering] is a boolean
/// indicating whether the widget is currently being hovered or not.
/// [child] is the child widget of [HoverBuilder] which won't be rebuilt
/// when [hovering] changes.
typedef HoverWidgetBuilder = Widget Function(
  BuildContext context,
  bool hovering,
  Widget? child,
);

/// A widget that detects mouse hover events and notifies its child.
/// This widget is useful when you want to change the appearance of a widget
/// when the mouse hovers over it.
///
/// Example:
///   HoverBuilder(
///     builder: (context, hovering, child) {
///       return AnimatedContainer(
///         duration: const Duration(milliseconds: 200),
///         width: 100,
///         height: 100,
///         color: hovering ? Colors.orange : Colors.red,
///         alignment: Alignment.center,
///         child: child,
///       );
///     },
///     child: const Text('Hover Me'),
///   ),
///
class HoverBuilder extends StatefulWidget {
  /// Builder that builds the child. This builder will be called whenever the
  /// hover state changes. The [hovering] parameter indicates whether the
  /// widget is currently being hovered or not.
  final HoverWidgetBuilder builder;

  /// Refers to the [MouseRegion.opaque] property.
  final bool opaque;

  /// Refers to the [MouseRegion.cursor] property.
  final MouseCursor cursor;

  /// Refers to the [MouseRegion.onEnter] property.
  final HitTestBehavior? hitTestBehavior;

  /// Child of this widget. This child will not be rebuilt when the hover
  /// state changes. It is recommended to use this child for static content
  /// that does not change when the hover state changes.
  final Widget? child;

  /// Whether the hover effect is enabled or not. If set to false, the cursor
  /// will be [MouseCursor.defer] and the hover effect will not be applied.
  final bool enabled;

  /// Called when a pointer enters the region.
  /// Refers to the [MouseRegion.onEnter] callback.
  final PointerEnterEventListener? onEnter;

  /// Called when a pointer hovers within the region.
  /// Refers to the [MouseRegion.onHover] callback.
  final PointerHoverEventListener? onHover;

  /// Called when a pointer exits the region.
  /// Refers to the [MouseRegion.onExit] callback.
  final PointerExitEventListener? onExit;

  /// Creates Hoverable widget with given values.
  const HoverBuilder({
    super.key,
    required this.builder,
    this.opaque = true,
    this.enabled = true,
    this.cursor = SystemMouseCursors.click,
    this.hitTestBehavior,
    this.onEnter,
    this.onHover,
    this.onExit,
    this.child,
  });

  @override
  State<HoverBuilder> createState() => HoverBuilderState();
}

/// State class for [HoverBuilder] widget.
class HoverBuilderState<T extends HoverBuilder> extends State<T> {
  bool _hovering = false;

  /// Returns whether the widget is currently being hovered or not.
  bool get hovering => _hovering;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: widget.opaque,
      cursor: widget.enabled ? widget.cursor : MouseCursor.defer,
      hitTestBehavior: widget.hitTestBehavior,
      onEnter: (event) {
        _hovering = true;
        onHoverStateChanged(_hovering);
        setState(() {});
        widget.onEnter?.call(event);
      },
      onHover: (event) {
        if (hovering) return;
        _hovering = true;
        onHoverStateChanged(_hovering);
        setState(() {});
        widget.onHover?.call(event);
      },
      onExit: (event) {
        _hovering = false;
        onHoverStateChanged(_hovering);
        setState(() {});
        widget.onExit?.call(event);
      },
      child: builder(context, hovering, widget.child),
    );
  }

  /// Called when the hover state changes. Use this method to perform any
  /// action when the hover state changes.
  void onHoverStateChanged(bool hovering) {}

  /// Override this method to build the widget using the builder function.
  Widget builder(BuildContext context, bool hovering, Widget? child) =>
      widget.builder(context, widget.enabled ? hovering : false, widget.child);
}
