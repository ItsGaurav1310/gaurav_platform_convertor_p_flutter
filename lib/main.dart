import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transform/Globals.dart';

void main() {
  runApp(
    (Globals.iOS == false)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: const HomePage(),
          )
        : const CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return (Globals.iOS == false)
        ? Scaffold(
            appBar: AppBar(
              title: const Text("Platform Convertor "),
              actions: [
                Switch(
                  value: Globals.iOS,
                  onChanged: (val) {
                    setState(() {
                      Globals.iOS = val;
                    });
                  },
                ),
              ],
            ),
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (defaultTargetPlatform == TargetPlatform.android) ...[
                      const Text("Hello Android"),
                      const SizedBox(
                        height: 30,
                      ),
                      const CircularProgressIndicator(),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Android"),
                      ),
                    ] else if (defaultTargetPlatform == TargetPlatform.iOS) ...[
                      const CupertinoActivityIndicator(
                          color: Colors.black, radius: 80),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: CupertinoButton(
                          color: Colors.blue,
                          onPressed: () {},
                          child: const Text("Ios Button"),
                        ),
                      ),
                    ]
                  ]),
            ),
          )
        : CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            navigationBar: CupertinoNavigationBar(
              middle: const Text("Platform Convertor"),
              leading: const Icon(CupertinoIcons.home),
              trailing: CupertinoSwitch(
                value: Globals.iOS,
                onChanged: (val) {
                  setState(() {
                    Globals.iOS = val;
                  });
                },
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CupertinoActivityIndicator(
                    color: Colors.black, radius: 80),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: CupertinoButton(
                    color: Colors.blue,
                    onPressed: () {},
                    child: const Text("Ios Button"),
                  ),
                ),
              ],
            ),
          );
  }
}
