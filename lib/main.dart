import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transform/Globals.dart';
import 'package:transform/plat_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PlatProvider()),
      ],
      child: Consumer<PlatProvider>(
        builder: (context, value, child) => (value.iOS == false)
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
      ),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? initialDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return (Provider.of<PlatProvider>(context).iOS == false)
        ? Scaffold(
            appBar: AppBar(
              title: const Text("Platform Convertor "),
              actions: [
                Switch(
                  value: Provider.of<PlatProvider>(context).iOS,
                  onChanged: (val) {
                    Provider.of<PlatProvider>(context, listen: false)
                        .changePlatform(val);
                  },
                ),
              ],
            ),
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Hello Android"),
                    const SizedBox(
                      height: 30,
                    ),
                    const CircularProgressIndicator(),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(initialDate.toString()),
                    ElevatedButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: initialDate!,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050));
                        setState(() {
                          initialDate = pickedDate;
                        });
                      },
                      child: const Text("Android"),
                    ),
                    // ] else if (defaultTargetPlatform == TargetPlatform.iOS) ...[
                    //   const CupertinoActivityIndicator(
                    //       color: Colors.black, radius: 80),
                    //   const SizedBox(
                    //     height: 50,
                    //   ),
                    //   Center(
                    //     child: CupertinoButton(
                    //       color: Colors.blue,
                    //       onPressed: () {},
                    //       child: const Text("Ios Button"),
                    //     ),
                    //   ),
                    // ]
                  ]),
            ),
          )
        : CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            navigationBar: CupertinoNavigationBar(
              middle: const Text("Platform Convertor"),
              leading: const Icon(CupertinoIcons.home),
              trailing: CupertinoSwitch(
                value: Provider.of<PlatProvider>(context).iOS,
                onChanged: (val) {
                  Provider.of<PlatProvider>(context, listen: false)
                      .changePlatform(val);
                },
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CupertinoActivityIndicator(
                      color: Colors.black, radius: 80),
                  const SizedBox(
                    height: 50,
                  ),
                  CupertinoTextSelectionToolbarButton(
                    child: Text("Hello"),
                    onPressed: () {},
                  ),
                  CupertinoNavigationBarBackButton(
                    onPressed: () {},
                  ),
                  Center(
                    child: CupertinoButton(
                      color: Colors.blue,
                      onPressed: () {},
                      child: const Text("Ios Button"),
                    ),
                  ),
                  Container(
                    height: 300,
                    color: Colors.yellow,
                    child: CupertinoDatePicker(
                      initialDateTime: initialDate,
                      dateOrder: DatePickerDateOrder.dmy,
                      mode: CupertinoDatePickerMode.date,
                      use24hFormat: true,
                      onDateTimeChanged: (DateTime date) {
                        setState(() {
                          initialDate = date;
                        });
                      },
                    ),
                  ),
                  Text(initialDate.toString()),
                ],
              ),
            ),
          );
  }
}
