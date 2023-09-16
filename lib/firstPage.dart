import 'package:flutter/material.dart';
import 'package:tic_tac_toe/MyHomePage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(),
          )),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff00D2FF), Color(0xff3A7BD5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Stack(
          children: [
            Positioned(
              left: -100,
              top: 120,
              child: Image.asset('assets/oo.png'),
            ),
            Positioned(
              right: -150,
              top: 50,
              child: Image.asset('assets/xx.png'),
            ),
            const Positioned(
              top: 310,
              right: 0,
              left: 0,
              child: Center(
                  child: Text(
                'TIC-TAC-TOE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset('assets/x.png'),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset('assets/o.png'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
