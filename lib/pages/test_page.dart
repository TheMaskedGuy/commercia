import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

int count = 0;
bool dies = false;

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        count++;
                        dies = !dies;
                        print(count);
                      });
                    },
                    child: Text('1 dies...')),
                Visibility(
                    visible: dies,
                    child: Container(
                      height: 100,
                      width: 200,
                      color: Colors.red,
                    )),
                Container(
                  height: 100,
                  width: 200,
                  color: Colors.yellow,
                ),
                Text('$count'),
              ],
            )),
      ),
    );
  }
}
