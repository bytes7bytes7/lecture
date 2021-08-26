import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: First(),
    );
  }
}

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              color: Colors.green,
              width: size.width,
              child: TextButton(
                child: const Text('Press Me'),
                onPressed: () {
                  setState(() {
                    selected = !selected;
                  });
                },
              ),
            ),
            AnimatedPositioned(
              right: selected ? 0 : -size.width,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Container(
                color: Colors.cyan,
                height: 100,
                width: size.width,
                child: TextButton(
                  child: const Text('Press Me'),
                  onPressed: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
