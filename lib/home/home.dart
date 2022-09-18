import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kuldii_04_state_management_bloc_builder/bloc/counter.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});
  MyCounter myCounter = MyCounter(startNum: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("FLUTTER BLOC"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<MyCounter, int>(
              bloc: myCounter,
              buildWhen: ((previous, current) {
                if (current % 2 == 0) {
                  return true;
                } else {
                  return true;
                }
              }),
              builder: (context, state) {
                return Text("$state", style: const TextStyle(fontSize: 50));
              },
            ),
            // StreamBuilder(
            //   stream: myCounter.stream,
            //   initialData: myCounter.startNum,
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     return Text("${snapshot.data}",
            //         style: const TextStyle(fontSize: 50));
            //   },
            // ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      myCounter.decrement();
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      myCounter.increment();
                    },
                    icon: const Icon(Icons.add)),
              ],
            )
          ],
        ));
  }
}
