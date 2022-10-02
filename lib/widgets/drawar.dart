import 'package:flutter/material.dart';
import 'package:soft_bd_task/view/all_movies_page.dart';
import 'package:soft_bd_task/view/chose_interest_page.dart';
import 'package:soft_bd_task/view/sign_up.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(

            children: [
              Spacer(),
              TextButton(onPressed: ()=>Navigator.pushNamed(context, SignUpPage.routeName),
                  child: Row(
                    children: const [
                      Icon(Icons.person,color: Colors.black,),
                      SizedBox(width: 15,),
                      Text('Sign up'),
                    ],
                  )),
              TextButton(onPressed: ()=>Navigator.pushNamed(context, AllMoviesPage.routeName),
                  child: Row(
                    children: const [
                      Icon(Icons.movie,color: Colors.black,),
                      SizedBox(width: 15,),
                      Text('All Movie'),
                    ],
                  )),
              TextButton(onPressed: ()=>Navigator.pushNamed(context, ChoseInterestPage.routeName),
                  child: Row(
                    children: const [
                      Icon(Icons.open_in_browser_outlined,color: Colors.black,),
                      SizedBox(width: 15,),
                      Text('Chose Option'),
                    ],
                  )),
              Spacer(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
