import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2AB2A1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 52.0,
                  ),
                  Image.asset(
                    "assets/image.png",
                    width: 52.0,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "Welcome, Doctor code \nSelect an option",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20.0,
                  children: <Widget>[
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: const Color.fromARGB(255, 21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/todo.png",
                                width: 64.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                "Pre-Operative",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              const Text(
                                "2 Items",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: const Color.fromARGB(255, 21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/note.png",
                                width: 64.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                "Intra-Operative",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              const Text(
                                "12 Items",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: const Color.fromARGB(255, 21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/calendar.png",
                                width: 64.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                "Post-Operative",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              const Text(
                                "4 Items",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: const Color.fromARGB(255, 21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/settings.png",
                                width: 64.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                "Settings",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              const Text(
                                "6 Items",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
