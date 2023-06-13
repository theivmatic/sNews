import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width, height;

  const ShimmerWidget({
    super.key,
    this.width = double.infinity,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).primaryColor,
        highlightColor: const Color.fromARGB(115, 187, 185, 185),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(157, 0, 0, 0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.all(8.0),
          width: width,
          height: height,
        ),
      ),
    );
  }
}
