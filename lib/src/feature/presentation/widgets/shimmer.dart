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
    return Shimmer.fromColors(
      baseColor: Theme.of(context).primaryColor,
      highlightColor: const Color.fromARGB(115, 224, 224, 224),
      child: ListView.separated(
        padding: const EdgeInsets.all(0.0),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.normal,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 194,
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 6, 10, 5),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
