import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Truco Marker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Truco Marker'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counterWe = 0;
  int _counterThey = 0;
  bool _isPlaying = true;
  String _winners = '';
  int _winsWe = 0;
  int _winsThey = 0;

  @override
  void initState() {
    super.initState();
  }

  void resetFields(bool all) {
    setState(() {
      _counterWe = 0;
      _counterThey = 0;
      _isPlaying = true;
      _winners = '';
      if (all) {
        _winsWe = 0;
        _winsThey = 0;
      }
    });
  }

  void _verifyWinners() {
    setState(() {
      _isPlaying = true;
      _winners = '';
      if (_counterWe == 11 && _counterThey == 11) {
        _winners = 'Mão de 11!';
      } else if (_counterWe >= 12 || _counterThey >= 12) {
        if (_counterWe > _counterThey) {
          _winners = 'We won!';
          _winsWe++;
        } else if (_counterWe < _counterThey) {
          _winners = 'They won!';
          _winsThey++;
        }
        _isPlaying = false;
      }
    });
  }

  void _incrementCounterWe(int value) {
    if (_counterWe + value < 0) {
      return;
    }

    setState(() {
      _counterWe += value;
    });
    _verifyWinners();
  }

  void _incrementCounterThey(int value) {
    if (_counterThey + value < 0) {
      return;
    }

    setState(() {
      _counterThey += value;
    });
    _verifyWinners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              resetFields(true);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _winners,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              buildCounter('We', _winsWe, _counterWe),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                      spacing: 20,
                      alignment: WrapAlignment.center,
                      runSpacing: 50,
                      children: [
                        ElevatedButton(
                          onPressed:
                              _isPlaying ? () => _incrementCounterWe(1) : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            fixedSize: const Size(80, 80),
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            '+1',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed:
                              _isPlaying ? () => _incrementCounterWe(3) : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            fixedSize: const Size(80, 80),
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            '+3',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed:
                              _isPlaying ? () => _incrementCounterWe(6) : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            fixedSize: const Size(80, 80),
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            '+6',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                      spacing: 20,
                      alignment: WrapAlignment.center,
                      runSpacing: 50,
                      children: [
                        ElevatedButton(
                          onPressed:
                              _isPlaying ? () => _incrementCounterWe(-1) : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            fixedSize: const Size(80, 80),
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            '-1',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed:
                              _isPlaying ? () => _incrementCounterWe(-3) : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            fixedSize: const Size(80, 80),
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            '-3',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed:
                              _isPlaying ? () => _incrementCounterWe(-6) : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            fixedSize: const Size(80, 80),
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            '-6',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]),
                ),
              ]),
            ]),
            IconButton(
              iconSize: 100,
              icon: const Icon(
                Icons.refresh,
                color: Colors.grey,
              ),
              onPressed: () {
                resetFields(false);
              },
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              buildCounter('Them', _winsThey, _counterThey),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                      spacing: 20,
                      alignment: WrapAlignment.center,
                      runSpacing: 50,
                      children: [
                        ElevatedButton(
                          onPressed: _isPlaying
                              ? () => _incrementCounterThey(1)
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            fixedSize: const Size(80, 80),
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            '+1',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _isPlaying
                              ? () => _incrementCounterThey(3)
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            fixedSize: const Size(80, 80),
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            '+3',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _isPlaying
                              ? () => _incrementCounterThey(6)
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            fixedSize: const Size(80, 80),
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            '+6',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                      spacing: 20,
                      alignment: WrapAlignment.center,
                      runSpacing: 50,
                      children: [
                        ElevatedButton(
                          onPressed: _isPlaying
                              ? () => _incrementCounterThey(-1)
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            fixedSize: const Size(80, 80),
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            '-1',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _isPlaying
                              ? () => _incrementCounterThey(-3)
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            fixedSize: const Size(80, 80),
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            '-3',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _isPlaying
                              ? () => _incrementCounterThey(-6)
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            fixedSize: const Size(80, 80),
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            '-6',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]),
                ),
              ]),
            ]),
          ]),
        ]),
      ),
    );
  }

  Column buildCounter(String team, int wins, int counter) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          team,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          '$counter',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          'vitórias ( $wins )',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
