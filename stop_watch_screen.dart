import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {
  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  //const StopWatchScreen({super.key});
  Timer? _timer;

  int _time = 0;

  bool _isRunning = false;

  List<String> _lapTimes = [];

  void _clickButton() {
    _isRunning = !_isRunning;
    if (_isRunning) {
      _start();
    } else {
      _pause();
    }
  }

  void _start() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  void _reset() {
    _isRunning = false;
    _timer?.cancel();
    _lapTimes.clear();
    _time = 0;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int sec = _time ~/100;
    String hundredth ='${_time %100}'.padLeft(2,'0');

    return Scaffold(
      appBar: AppBar(
        title: const Text('스톱워치'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$sec',
                style: TextStyle(fontSize: 50),
              ),
              Text(
                '$hundredth',
              ),
            ],
          ),
          SizedBox(
            width: 100,
            height: 200,
            child: ListView(
              children: [
                Text('111'),
                Text('111'),
                Text('111'),
                Text('111'),
                Text('111'),
                Text('111'),
                Text('111'),
                Text('111'),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.orange,
                onPressed: () {
                  _reset();
                },
                child: Icon(Icons.refresh),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _clickButton();
                  });
                },
                child: _isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
              ),
              FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {},
                child: Icon(Icons.add),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
