import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cats/data/source/hive_model/hive_model.dart';

import '../../bloc/basket/basket_bloc.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final _bloc = BasketBloc();
  List<HiveModel> data = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc..add(GetAllProductsFromBasketEvent()),
      child: BlocConsumer<BasketBloc, BasketState>(
        listener: (context, state) {
          if (state is GetAllProductsFromBasketState) {
            setState(() {
              data = List.from(state.data);
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Text(data[index].text ?? ""),
                        Padding(
                          padding: const EdgeInsets.only(left: 98.0),
                          child: Text(data[index].date??""),
                        )
                      ],
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
