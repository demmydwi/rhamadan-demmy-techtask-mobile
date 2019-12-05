import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmer extends StatelessWidget {
  final EdgeInsets margin;
  final int itemCount;

  MyShimmer({this.margin = const EdgeInsets.all(0), this.itemCount = 3});

  final hlColor = Colors.grey.shade50;
  final defColor = Colors.grey.shade200;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: margin,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(itemCount, (_) => item()).toList(),
    ));
  }

  Widget item() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 40,
            child: Shimmer.fromColors(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    margin: EdgeInsets.all(0),
                    color: defColor,
                  ),
                ),
                baseColor: defColor,
                highlightColor: hlColor),
          ),
          Padding(padding: EdgeInsets.only(right: 12)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 16,
                width: 200,
                child: Shimmer.fromColors(
                    child: Container(
                      margin: EdgeInsets.all(0),
                      color: defColor,
                    ),
                    baseColor: defColor,
                    highlightColor: hlColor),
              ),
              Padding(padding: EdgeInsets.only(top: 12)),
              Container(
                height: 16,
                width: 100,
                child: Shimmer.fromColors(
                    child: Container(
                      margin: EdgeInsets.all(0),
                      color: defColor,
                    ),
                    baseColor: defColor,
                    highlightColor: hlColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
