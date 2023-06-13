import 'package:flutter/material.dart';
import 'package:snews/src/feature/domain/models/news/news.dart';

class DetailsScreen extends StatelessWidget {
  final NewsEntity loaded;

  const DetailsScreen({
    super.key, required this.loaded,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'sNews',
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontFamily: 'Ancient',
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            child: Image.network(
                    loaded.results![0].multimedia![0].url.toString(),
                    fit: BoxFit.fitWidth,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: Text(
              loaded.results![0].title.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: Text(
              loaded.results![0].abstract.toString(),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          // Text(state.loaded.results![index].url.toString(),),
        ],
      ),
    );
  }
}
