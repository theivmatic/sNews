import 'package:flutter/material.dart';
import 'package:snews/src/feature/domain/models/news/news.dart';
import 'package:snews/src/feature/presentation/widgets/popup_menu.dart';

class DetailsScreen extends StatelessWidget {
  final Result loaded;

  const DetailsScreen({
    super.key,
    required this.loaded,
  });

  Future<void> _refresh() async {}

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      backgroundColor: const Color.fromARGB(66, 160, 160, 160),
      color: Colors.black,
      child: Scaffold(
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
          title: const Padding(
            padding: EdgeInsets.only(left: 75),
            child: Text(
              'sNews',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: 'Ancient',
              ),
            ),
          ),
          actions: const [
            PopUpWidget(),
          ],
          backgroundColor: Colors.white,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal,
          ),
          children: [
            SizedBox(
              child: Image.network(
                loaded.multimedia![0].url.toString(),
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: Text(
                loaded.title.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: Text(
                loaded.abstract.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: Text(
                'Last update: ${loaded.updatedDate.toString()}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(66, 160, 160, 160),
                  ),
                  foregroundColor: MaterialStatePropertyAll(Colors.black),
                ),
                onPressed: () {},
                child: const Text(
                  'Click here to read full version',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
