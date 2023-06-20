import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.dark),
      title: 'Tic Tac Toe',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          useMaterial3: true),
      home: const GridWidget(),
    );
  }
}

class GridWidget extends StatefulWidget {
  const GridWidget({super.key});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  bool trun = true;
  int draw = 0;
  List<String> test = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  void checkWinner(BuildContext context) {
    if (test[0] == test[1] && test[0] == test[2] && test[0] != '') {
      showWinner(context, test[0]);
      return;
    }

    if (test[0] == test[4] && test[0] == test[8] && test[0] != '') {
      showWinner(context, test[0]);
      return;
    }

    if (test[0] == test[3] && test[0] == test[6] && test[0] != '') {
      showWinner(context, test[0]);
      return;
    }

    if (test[3] == test[4] && test[3] == test[5] && test[3] != '') {
      showWinner(context, test[3]);
      return;
    }

    if (test[6] == test[4] && test[6] == test[2] && test[6] != '') {
      showWinner(context, test[6]);
      return;
    }

    if (test[6] == test[7] && test[6] == test[8] && test[6] != '') {
      showWinner(context, test[6]);
      return;
    }

    if (test[3] == test[4] && test[3] == test[5] && test[3] != '') {
      showWinner(context, test[3]);
      return;
    }

    if (test[3] == test[4] && test[3] == test[5] && test[3] != '') {
      showWinner(context, test[3]);
      return;
    }

    if (test[1] == test[4] && test[1] == test[7] && test[1] != '') {
      showWinner(context, test[1]);
      return;
    }

    for (int i = 0; i < test.length; i++) {
      if (test[i] != '') {
        draw = draw + 1;
      }

      if (draw == 9) {
        showDraw(context);
      }
    }

    draw = 0;
  }

  void showDraw(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Its a Draw !!!',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    test = [
                      '',
                      '',
                      '',
                      '',
                      '',
                      '',
                      '',
                      '',
                      '',
                    ];
                  });

                  trun = true;

                  Navigator.pop(context);
                },
                child: const Text('Play Again'))
          ],
        );
      },
    );
  }

  void showWinner(BuildContext context, String x) {
    showDialog(
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            x == 'X'
                ? const Text(
                    'Player 1 X is the winner',
                    style: TextStyle(fontSize: 30),
                  )
                : const Text(
                    'Player 2 O is the winner',
                    style: TextStyle(fontSize: 30),
                  ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    test = [
                      '',
                      '',
                      '',
                      '',
                      '',
                      '',
                      '',
                      '',
                      '',
                    ];
                  });

                  trun = true;

                  Navigator.pop(context);
                },
                child: const Text('Reset'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (trun) {
                        test[index] = 'X';
                      } else {
                        test[index] = 'O';
                      }
                    });

                    trun = !trun;

                    checkWinner(context);
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Center(
                      child: Text(
                        test[index],
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          trun == true
              ? const Text(
                  'Player one Trun',
                  style: TextStyle(fontSize: 30),
                )
              : const Text(
                  'Player Two Trun',
                  style: TextStyle(fontSize: 30),
                )
        ],
      ),
    );
  }
}
