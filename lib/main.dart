import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      home: ChangeNotifierProvider(
        create: (BuildContext context) => Counter(),
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Hello World!'),
                Builder(
                  builder: (context) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            context.read<Counter>().add();
                          },
                          icon: const Icon(Icons.add),
                        ),
                        Text('${context.watch<Counter>().counter}'),
                        IconButton(
                          onPressed: () {
                            context.read<Counter>().subtract();
                          },
                          icon: const Icon(Icons.remove),
                        ),
                      ],
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
}

class Counter extends ChangeNotifier {
  int counter = 0;

  void add() {
    counter++;
    notifyListeners();
  }

  void subtract() {
    counter--;
    notifyListeners();
  }
}
