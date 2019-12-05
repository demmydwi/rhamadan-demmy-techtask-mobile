import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmer extends StatelessWidget {
  final EdgeInsets margin;
  final int itemCount;

  MyShimmer({this.margin = const EdgeInsets.all(0), this.itemCount = 2});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        item(),
        item(),
      ],
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
                    color: Colors.grey.shade300,
                  ),
                ),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white),
          ),
          Padding(padding: EdgeInsets.only(top: 12)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 16,
                width: 200,
                child: Shimmer.fromColors(
                    child: Container(
                      margin: EdgeInsets.all(0),
                      color: Colors.grey.shade300,
                    ),
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white),
              ),
              Padding(padding: EdgeInsets.only(top: 12)),
              Container(
                height: 16,
                width: 100,
                child: Shimmer.fromColors(
                    child: Container(
                      margin: EdgeInsets.all(0),
                      color: Colors.grey.shade300,
                    ),
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
