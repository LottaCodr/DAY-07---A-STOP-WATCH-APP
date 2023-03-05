import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(const MaterialApp(
  home: StopWatch(),
));


class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  void _startTImer(){
    setState(() {
      _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        setState(() {

        });
      });
    });
  }

  void _stopTimer(){
    setState(() {
      _timer?.cancel();
      _stopwatch.stop();
    });
  }

  void _resetTimer(){
    setState(() {
      _stopwatch.reset();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    String _getTime(){
      final duration = _stopwatch.elapsed;
      final milliseconds = (duration.inMilliseconds % 100) ~/ 10;
      final seconds = duration.inSeconds % 60;
      final minutes = duration.inMinutes % 60;
      final hours = duration.inHours % 24;
      return '${hours.toString().padLeft(2, '0')}: '
          '${minutes.toString().padLeft(2,'0')}: '
          '${seconds.toString().padLeft(2,'0')}:'
          '${milliseconds.toString().padLeft(2,'0')}';
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('THE WATCH STOPPER '),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _getTime(),
            style: const TextStyle(
              fontSize: 62,
            ),),

            const SizedBox(height: 48),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                    onPressed: _resetTimer,
                  child: const Icon(Icons.refresh),
                ),

                const SizedBox(width: 24),

                FloatingActionButton(
                    onPressed: _stopTimer,
                child: const Icon(Icons.stop),
                ),

                const SizedBox(width: 24),

                FloatingActionButton(
                    onPressed: (){
                      _stopwatch.start();
                      _startTImer();
                    },
                child: const Icon(Icons.play_arrow),)


              ],
            )

          ],
        ),
      ),
    );
  }
}
