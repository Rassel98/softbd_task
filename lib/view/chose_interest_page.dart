import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soft_bd_task/provider/softbd_task_provider.dart';
import 'package:soft_bd_task/widgets/chose_widgets.dart';

class ChoseInterestPage extends StatelessWidget {
  static const String routeName = '/chose';
  const ChoseInterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Chose Your Interests',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Consumer<SoftbdTaskProvider>(
            builder: (context, provider, child) =>Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    childAspectRatio: 0.8),
                itemCount: provider.movieModel!.data!.length,
                itemBuilder: (context, index) {
                  final movie =provider.movieModel!.data![index];

                  return ChoseItem(movie: movie);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {},
            //splashColor: Colors.red,
            child: Container(
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.center,
              width: double.maxFinite,
              height: 60,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Text(
                'Next',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  
}
