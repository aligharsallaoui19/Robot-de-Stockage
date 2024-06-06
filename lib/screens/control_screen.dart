import 'package:flutter/material.dart';

// components
import '../components/my_elevated_button.dart';

// services
import '../services/control.dart';

class ControlScreen extends StatelessWidget {
  static String screenId = "/control_screen";
  ControlScreen({super.key});

  final ControlService controlService = ControlService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control the Robot'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MyElevatedButton(
                    label: "Forward",
                    onPressed: () => controlService.addMove("Forward"),
                    color: Colors.blue,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MyElevatedButton(
                        label: "Left",
                        onPressed: () => controlService.addMove("Left"),
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 20),
                      MyElevatedButton(
                        label: "Right",
                        onPressed: () => controlService.addMove("Right"),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  MyElevatedButton(
                    label: "Backward",
                    onPressed: () => controlService.addMove("BAckward"),
                    color: Colors.blue,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MyElevatedButton(
                    label: "Up",
                    onPressed: () => controlService.addMove("Up"),
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 20),
                  MyElevatedButton(
                    label: "Stop",
                    onPressed: () => controlService.addMove("Stop"),
                    color: Colors.red,
                  ),
                  const SizedBox(height: 20),
                  MyElevatedButton(
                    label: "Down",
                    onPressed: () => controlService.addMove("Down"),
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
