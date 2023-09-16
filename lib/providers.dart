import 'package:flutter/material.dart';

class tictactoe extends ChangeNotifier {
  String? player1;
  String? player2;
  String msg = '';
  String turn = 'X';
  String finalMsg = '';
  List count = [];
  String one0 = '';
  String one1 = '';
  String one2 = '';
  String two0 = '';
  String two1 = '';
  String two2 = '';
  String three0 = '';
  String three1 = '';
  String three2 = '';

  bool one0Bool = true;
  bool one1Bool = true;
  bool one2Bool = true;
  bool two0Bool = true;
  bool two1Bool = true;
  bool two2Bool = true;
  bool three0Bool = true;
  bool three1Bool = true;
  bool three2Bool = true;

  void listAddFunc() {
    if (count.length.isEven) {
      count.add('x');

      turn = 'O';

      notifyListeners();
    } else {
      count.add('o');

      turn = 'X';

      notifyListeners();
    }
  }

  void winner(BuildContext context) {
    notifyListeners();

    if (one0 == 'x' && one1 == 'x' && one2 == 'x' ||
        one0 == 'o' && one1 == 'o' && one2 == 'o') {
      if (one0 == 'x' && one1 == 'x' && one2 == 'x') {
        msg = 'X is Winner';
      } else {
        msg = 'O is Winner';
      }
    } else if (two0 == 'x' && two1 == 'x' && two2 == 'x' ||
        two0 == 'o' && two1 == 'o' && two2 == 'o') {
      if (two0 == 'x' && two1 == 'x' && two2 == 'x') {
        msg = 'X is Winner';
      } else {
        msg = 'O is Winner';
      }
    } else if (three0 == 'x' && three1 == 'x' && three2 == 'x' ||
        three0 == 'o' && three1 == 'o' && three2 == 'o') {
      if (three0 == 'x' && three1 == 'x' && three2 == 'x') {
        msg = 'X is Winner';
      } else {
        msg = 'O is Winner';
      }
    } else if (one0 == 'x' && two0 == 'x' && three0 == 'x' ||
        one0 == 'o' && two0 == 'o' && three0 == 'o') {
      if (one0 == 'x' && two0 == 'x' && three0 == 'x') {
        msg = 'X is Winner';
      } else {
        msg = 'O is Winner';
      }
    } else if (one1 == 'x' && two1 == 'x' && three1 == 'x' ||
        one1 == 'o' && two1 == 'o' && three1 == 'o') {
      if (one1 == 'x' && two1 == 'x' && three1 == 'x') {
        msg = 'X is Winner';
      } else {
        msg = 'O is Winner';
      }
    } else if (one2 == 'x' && two2 == 'x' && three2 == 'x' ||
        one2 == 'o' && two2 == 'o' && three2 == 'o') {
      if (one2 == 'x' && two2 == 'x' && three2 == 'x') {
        msg = 'X is Winner';
      } else {
        msg = 'O is Winner';
      }
    } else if (one0 == 'x' && two1 == 'x' && three2 == 'x' ||
        one0 == 'o' && two1 == 'o' && three2 == 'o') {
      if (one0 == 'x' && two1 == 'x' && three2 == 'x') {
        msg = 'X is Winner';
      } else {
        msg = 'O is Winner';
      }
    } else if (one2 == 'x' && two1 == 'x' && three0 == 'x' ||
        one2 == 'o' && two1 == 'o' && three0 == 'o') {
      if (one2 == 'x' && two1 == 'x' && three0 == 'x') {
        msg = 'X is Winner';
      } else {
        msg = 'O is Winner';
      }
    }
    notifyListeners();
    if (msg == 'O is Winner' || msg == 'X is Winner') {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: msg.length < 5
              ? const Text('Sure you want ?')
              : const Text('Game Over'),
          content: msg.length < 5
              ? const Text(
                  'Restart Game...',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              : Text(
                  finalMsg.isNotEmpty ? '$finalMsg 🏆' : '$msg 🏆',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
          actions: [
            msg.length < 5
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'))
                : const SizedBox(),
            ElevatedButton(
                onPressed: () {
                  resetGame();
                  Navigator.pop(context);
                },
                child: const Text('New Game'))
          ],
        ),
      );
    }
    try {
      if (player1!.isNotEmpty && player2!.isNotEmpty) {
        if (msg == 'X is Winner') {
          finalMsg = '$player1 is Winner';
        }
        if (msg == 'O is Winner') {
          finalMsg = '$player2 is Winner';
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void resetGame() {
    msg = '';
    turn = 'X';
    finalMsg = '';
    count = [];
    one0 = '';
    one1 = '';
    one2 = '';
    two0 = '';
    two1 = '';
    two2 = '';
    three0 = '';
    three1 = '';
    three2 = '';

    one0Bool = true;
    one1Bool = true;
    one2Bool = true;
    two0Bool = true;
    two1Bool = true;
    two2Bool = true;
    three0Bool = true;
    three1Bool = true;
    three2Bool = true;
    notifyListeners();
  }
}
