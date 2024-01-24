import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cats/bloc/home_bloc.dart';
import 'package:random_cats/data/source/model/cat_model.dart';
import 'package:random_cats/presentor/saved_screen/saved_screen.dart';

import '../../data/source/hive_model/hive_model.dart';
import '../../utils/hive_helper.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = HomeBloc();

  @override
  void initState() {
    bloc.add(InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 48.0, left: 350),
              child: InkWell(
                child: const Icon(size: 30, Icons.save),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SavedScreen()));
                },
              ),
            ),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child; // If the image is loaded, return the actual image
                    } else {
                      return const Center(
                        child:
                            CircularProgressIndicator(), // Placeholder while the image is loading
                      );
                    }
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return const Center(
                      child:
                          Icon(Icons.error), // Placeholder for failed loading
                    );
                  },
                  'https://cataas.com/cat?${DateTime.now().millisecondsSinceEpoch}',
                  height: 200,
                  width: 200,
                ),
                Text(textAlign: TextAlign.center, "${state.myModel?.text}"),
                Padding(
                  padding: const EdgeInsets.only(top: 38.0),
                  child: Container(
                    width: 200,
                    height: 50,
                    child: FloatingActionButton(
                        child: Text("Change cat"),
                        onPressed: () {
                          bloc.add(InitialEvent());
                          HiveHelper.addCatToBasket(HiveModel(
                            id: state.myModel?.sId,
                            text: state.myModel?.text,
                            date: "${DateTime.now()}"
                          ));
                        }),
                  ),
                )
              ],
            )),
          ]));
        },
      ),
    );
  }
}
