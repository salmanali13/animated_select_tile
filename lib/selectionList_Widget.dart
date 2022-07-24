

import 'package:flutter/material.dart';


/// This widget builds the `Animated Selected` Tile item with a radio button
/// at the trailing side
/// By Default the `[radio button]` is showed at the start of the tile
///
class AnimatedSelectionTile extends StatefulWidget {
  String text;
  Color selectionColor;
  Color unSelectedColor;
  double tileBorder;
  /// Whehter to show radio button at the start or end
  /// by default it is `[false]`
  bool trailing;
  /// Set the alignment of the content within the tile
  /// by default it is `[SpaceAround]`
  MainAxisAlignment mainAxisAlignment;
  AnimatedSelectionTile(
      {
        required this.selectionColor,
        required this.unSelectedColor,
        required this.text,
        this.trailing = false,
        this.tileBorder = 10,

        this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
        Key? key,
      }) : super(key: key);
  @override
  State<AnimatedSelectionTile> createState() => _AnimatedSelectionTileState();
}

class _AnimatedSelectionTileState extends State<AnimatedSelectionTile> {
  bool changing = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            changing = !changing;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
              color: changing == false
                  ? widget.unSelectedColor.withOpacity(0.0)
                  : widget.selectionColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(widget.tileBorder),
              border: Border.all(
                  width: 1.5,
                  color: changing == false
                      ? widget.unSelectedColor.withOpacity(0.5)
                      :widget.selectionColor)),
          child: Row(
            mainAxisAlignment:  widget.mainAxisAlignment,
            children: [
              widget.trailing == true
                  ?  Container()
              : Expanded(child: buildCustomText(text: widget.text)),

              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                constraints: const BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: changing == false
                          ? widget.unSelectedColor
                          : widget.selectionColor,
                      width: 1.5),
                  color: changing == false
                      ? widget.selectionColor.withOpacity(0)
                      : widget.selectionColor.withOpacity(1),
                ),
              ),

              widget.trailing == true
                  ?Expanded(child: buildCustomText(text: widget.text))
                  :Container( color: Colors.red,),
            ],
          ),
        ),
      ),
    );
  }


  /// This widget creates a text field with custom text and style
   Widget buildCustomText(
      {required String text, double? fontSize, Color? color}) {
    return SingleChildScrollView(
      child: Text(
        text,
        textAlign: widget.trailing ?TextAlign.right :TextAlign.left,
        style: TextStyle(
            color: color ?? Colors.black,
            fontSize: fontSize ?? 14,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
