import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soft_bd_task/provider/softbd_task_provider.dart';

import 'home_page.dart';

class AllMoviesPage extends StatelessWidget {
  static const String routeName = 'all_movie';
  const AllMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, HomePage.routeName),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: const Center(
            child: Text(
          'All Movie',
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: Consumer<SoftbdTaskProvider>(
        builder: (context, provider, child) => Stepper(
          elevation: 5,
          controlsBuilder: (context, details) => Row(
            children: [],
          ),
          currentStep: provider.stepperIndex,
          // onStepCancel: () {
          //   if (provider.stepperIndex > 0) {
          //     provider.onStepCancelIndex();
          //   }
          // },
          // onStepContinue: () {
          //   if (provider.stepperIndex <= 0) {
          //     provider.onStepContinueIndex();
          //   }
          // },
          // onStepTapped: (int index) {
          //   provider.stepperIndexChange(index);
          // },
          steps: provider.movieModel!.data!
              .map((movie) => Step(
                    content: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(movie.details!),
                      ),
                    ),
                    title: Text(movie.title!),
                  ))
              .toList(),
        ),

      ),
    );
  }
}
