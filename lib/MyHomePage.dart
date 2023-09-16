import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/providers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController Firstplayername = TextEditingController();
  TextEditingController Secondplayername = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.7),
        builder: (context) => AlertDialog(
              title: const Text('Players Names'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                      decoration: const InputDecoration(
                          hintText: 'First player name',
                          icon: Icon(Icons.clear)),
                      controller: Firstplayername),
                  TextField(
                    decoration: const InputDecoration(
                        hintText: 'Second player name',
                        icon: Icon(Icons.circle_outlined)),
                    controller: Secondplayername,
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      var a = Provider.of<tictactoe>(context, listen: false);
                      a.player1 = Firstplayername.text.toString();
                      a.player2 = Secondplayername.text.toString();
                      Navigator.pop(context);
                    },
                    child: const Text('Save')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Play With Default name'))
              ],
            )));
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 80,
          ),
          const Text(
            'TIC-TAC-TOE',
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
          Expanded(
            child: Center(
                child: Consumer<tictactoe>(
              builder: (context, nValue, child) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${nValue.turn}\'s Turn',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white)),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 5,
                              blurRadius: 2,
                              blurStyle: BlurStyle.outer),
                          BoxShadow(
                              color: Colors.white54,
                              spreadRadius: 10,
                              blurRadius: 3,
                              blurStyle: BlurStyle.outer)
                        ],
                        gradient: LinearGradient(
                            transform: const GradientRotation(9),
                            colors: [
                              Colors.blue.shade900,
                              Colors.green,
                              Colors.pink.shade800,
                              Colors.purpleAccent.shade200,
                              Colors.lightBlue.shade800,
                              Colors.blue.shade900,
                              Colors.green,
                              Colors.pink.shade800,
                            ])),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (nValue.one0Bool) {
                                    if (nValue.count.length.isEven) {
                                      nValue.one0 = 'x';
                                    } else {
                                      nValue.one0 = 'o';
                                    }
                                    nValue.listAddFunc();
                                    nValue.one0Bool = false;
                                    setState(() {});
                                    nValue.winner(context);
                                  }
                                },
                                child: Container(
                                    height: 85,
                                    width: 85,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black)),
                                    child: Text(nValue.one0,
                                        style: TextStyle(
                                            fontSize: 50,
                                            color: nValue.one0 == 'x'
                                                ? Colors.black.withOpacity(0.8)
                                                : Colors.red))),
                              ),
                              InkWell(
                                onTap: () {
                                  if (nValue.one1Bool) {
                                    if (nValue.count.length.isEven) {
                                      nValue.one1 = 'x';
                                    } else {
                                      nValue.one1 = 'o';
                                    }
                                    nValue.listAddFunc();
                                    nValue.one1Bool = false;
                                    setState(() {});
                                    nValue.winner(context);
                                  }
                                },
                                child: Container(
                                    height: 85,
                                    width: 85,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black)),
                                    child: Text(nValue.one1,
                                        style: TextStyle(
                                            fontSize: 50,
                                            color: nValue.one1 == 'x'
                                                ? Colors.black.withOpacity(0.8)
                                                : Colors.red))),
                              ),
                              InkWell(
                                onTap: () {
                                  if (nValue.one2Bool) {
                                    if (nValue.count.length.isEven) {
                                      nValue.one2 = 'x';
                                    } else {
                                      nValue.one2 = 'o';
                                    }
                                    nValue.listAddFunc();
                                    nValue.one2Bool = false;
                                    setState(() {});
                                    nValue.winner(context);
                                  }
                                },
                                child: Container(
                                    height: 85,
                                    width: 85,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black)),
                                    child: Text(nValue.one2,
                                        style: TextStyle(
                                            fontSize: 50,
                                            color: nValue.one2 == 'x'
                                                ? Colors.black.withOpacity(0.8)
                                                : Colors.red))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (nValue.two0Bool) {
                                    if (nValue.count.length.isEven) {
                                      nValue.two0 = 'x';
                                    } else {
                                      nValue.two0 = 'o';
                                    }
                                    nValue.listAddFunc();
                                    nValue.two0Bool = false;
                                    setState(() {});
                                    nValue.winner(context);
                                  }
                                },
                                child: Container(
                                    height: 85,
                                    width: 85,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black)),
                                    child: Text(nValue.two0,
                                        style: TextStyle(
                                            fontSize: 50,
                                            color: nValue.two0 == 'x'
                                                ? Colors.black.withOpacity(0.8)
                                                : Colors.red))),
                              ),
                              InkWell(
                                onTap: () {
                                  if (nValue.two1Bool) {
                                    if (nValue.count.length.isEven) {
                                      nValue.two1 = 'x';
                                    } else {
                                      nValue.two1 = 'o';
                                    }
                                    nValue.listAddFunc();
                                    nValue.two1Bool = false;
                                    setState(() {});
                                    nValue.winner(context);
                                  }
                                },
                                child: Container(
                                    height: 85,
                                    width: 85,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black)),
                                    child: Text(nValue.two1,
                                        style: TextStyle(
                                            fontSize: 50,
                                            color: nValue.two1 == 'x'
                                                ? Colors.black.withOpacity(0.8)
                                                : Colors.red))),
                              ),
                              InkWell(
                                onTap: () {
                                  if (nValue.two2Bool) {
                                    if (nValue.count.length.isEven) {
                                      nValue.two2 = 'x';
                                    } else {
                                      nValue.two2 = 'o';
                                    }
                                    nValue.listAddFunc();
                                    nValue.two2Bool = false;
                                    setState(() {});
                                    nValue.winner(context);
                                  }
                                },
                                child: Container(
                                    height: 85,
                                    width: 85,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black)),
                                    child: Text(nValue.two2,
                                        style: TextStyle(
                                            fontSize: 50,
                                            color: nValue.two2 == 'x'
                                                ? Colors.black.withOpacity(0.8)
                                                : Colors.red))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (nValue.three0Bool) {
                                    if (nValue.count.length.isEven) {
                                      nValue.three0 = 'x';
                                    } else {
                                      nValue.three0 = 'o';
                                    }
                                    nValue.listAddFunc();
                                    nValue.three0Bool = false;
                                    setState(() {});
                                    nValue.winner(context);
                                  }
                                },
                                child: Container(
                                    height: 85,
                                    width: 85,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black)),
                                    child: Text(nValue.three0,
                                        style: TextStyle(
                                            fontSize: 50,
                                            color: nValue.three0 == 'x'
                                                ? Colors.black.withOpacity(0.8)
                                                : Colors.red))),
                              ),
                              InkWell(
                                onTap: () {
                                  if (nValue.three1Bool) {
                                    if (nValue.count.length.isEven) {
                                      nValue.three1 = 'x';
                                    } else {
                                      nValue.three1 = 'o';
                                    }
                                    nValue.listAddFunc();
                                    nValue.three1Bool = false;
                                    setState(() {});
                                    nValue.winner(context);
                                  }
                                },
                                child: Container(
                                    height: 85,
                                    width: 85,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black)),
                                    child: Text(nValue.three1,
                                        style: TextStyle(
                                            fontSize: 50,
                                            color: nValue.three1 == 'x'
                                                ? Colors.black.withOpacity(0.8)
                                                : Colors.red))),
                              ),
                              InkWell(
                                onTap: () {
                                  if (nValue.three2Bool) {
                                    if (nValue.count.length.isEven) {
                                      nValue.three2 = 'x';
                                    } else {
                                      nValue.three2 = 'o';
                                    }
                                    nValue.listAddFunc();
                                    nValue.three2Bool = false;
                                    setState(() {});
                                    nValue.winner(context);
                                  }
                                },
                                child: Container(
                                    height: 85,
                                    width: 85,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black)),
                                    child: Text(
                                      nValue.three2,
                                      style: TextStyle(
                                          fontSize: 50,
                                          color: nValue.three2 == 'x'
                                              ? Colors.black.withOpacity(0.8)
                                              : Colors.red),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                            title: nValue.msg.length < 5
                                ? const Text('Sure you want ?')
                                : const Text('Congratulations'),
                            content: nValue.msg.length < 5
                                ? const Text(
                                    'Restart Game...',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    '${nValue.msg} 🥳💥',
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                            actions: [
                              nValue.msg.length < 5
                                  ? ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel'))
                                  : const SizedBox(),
                              ElevatedButton(
                                  onPressed: () {
                                    nValue.resetGame();
                                    Navigator.pop(context);
                                  },
                                  child: const Text('New Game'))
                            ],
                          ),
                        );
                      },
                      child: const Text('Reset Game')),
                ],
              ),
            )),
          ),
        ],
      ),
    ));
  }
}
