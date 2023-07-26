// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double redC = 0;
  double blueC = 0;
  double greenC = 0;
  double alph = 255;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MaterialApp(
          title: 'Color mixer',
          theme: ThemeData(useMaterial3: true, colorScheme: lightDynamic),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkDynamic,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Neoarch color mixer'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      try {
                        await Clipboard.setData(
                            ClipboardData(text: "$alph,$redC,$greenC,$blueC"));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                    },
                    child: CircleAvatar(
                      radius: 158,
                      backgroundColor: Color.fromARGB(alph.toInt(),
                          redC.toInt(), greenC.toInt(), blueC.toInt()),
                    ),
                  ),
                  const Text(
                      "tip: click the big circle to copy ARGB values to clipboard"),

                  // red
                  Row(
                    children: [
                      const Text("   red    "),
                      Expanded(
                        child: Slider(
                          value: redC,
                          onChanged: (value) {
                            setState(() {
                              redC = value;
                            });
                          },
                          min: 0,
                          max: 255,
                          divisions: 255,
                          label: redC.toInt().toString(),
                        ),
                      )
                    ],
                  ),

                  // green
                  Row(
                    children: [
                      const Text("   green"),
                      Expanded(
                        child: Slider(
                          value: greenC,
                          onChanged: (value) {
                            setState(() {
                              greenC = value;
                            });
                          },
                          min: 0,
                          max: 255,
                          divisions: 255,
                          label: greenC.toInt().toString(),
                        ),
                      )
                    ],
                  ),

                  // blue
                  Row(
                    children: [
                      const Text("   blue  "),
                      Expanded(
                        child: Slider(
                          value: blueC,
                          onChanged: (value) {
                            setState(() {
                              blueC = value;
                            });
                          },
                          min: 0,
                          max: 255,
                          divisions: 255,
                          label: blueC.toInt().toString(),
                        ),
                      )
                    ],
                  ),

                  // Alpha

                  Row(
                    children: [
                      const Text("   alpha"),
                      Expanded(
                        child: Slider(
                          value: alph,
                          onChanged: (value) {
                            setState(() {
                              alph = value;
                            });
                          },
                          min: 0,
                          max: 255,
                          divisions: 255,
                          label: alph.toInt().toString(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
