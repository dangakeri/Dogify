import 'package:dogify/Api%20Model/apiService.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Dog> myData;
  @override
  void initState() {
    myData = ApiService.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder<Dog>(
          future: myData,
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(
              child: Stack(
                children: [
                  Image(image: NetworkImage(snapshot.data!.image)),
                  Positioned(
                    top: 10,
                    left: 15,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(12),
                        child: Text(snapshot.data!.image
                            .split('breeds\/')[1]
                            .split('/')[0])),
                  )
                ],
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Dan');
          setState(() {
            myData = ApiService.getData();
          });
        },
        child: const Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}
