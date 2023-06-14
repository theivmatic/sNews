import 'package:flutter/material.dart';
import 'package:snews/src/feature/domain/models/news/news.dart';
import 'package:snews/src/feature/presentation/screens/details.dart';

class NewsCardWidget extends StatelessWidget {
  final Result loaded;

  const NewsCardWidget({
    super.key,
    required this.loaded,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(loaded: loaded),
            ),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(66, 160, 160, 160),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Wrap(
              direction: Axis.horizontal,
              children: [
                SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Image.network(
                      loaded.multimedia![0].url.toString(),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SizedBox(
                  width: 194,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                        child: Text(
                          loaded.title.toString(),
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(18, 18, 18, 1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                        child: Text(
                          loaded.abstract.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color.fromRGBO(90, 90, 90, 1),
                          ),
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
