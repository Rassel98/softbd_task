import 'package:flutter/material.dart';
import 'package:soft_bd_task/model/movie_model.dart';

class MovieDetailsPage extends StatelessWidget {
  static const String routeName='/movie_details';

  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieDetails=ModalRoute.of(context)!.settings.arguments as MovieData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
        title: Text('Details of ${movieDetails.title}',style: TextStyle(color: Colors.black),),
      ),
      body:ListView(
        padding: EdgeInsets.all(12),
        children: [
          Image.network(movieDetails.imagePath!,width: double.maxFinite,height: 300,fit: BoxFit.cover,),
          SizedBox(height: 5,),
          Text(movieDetails.title!,style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
         SizedBox(height: 10,),
          Text(movieDetails.details!,)
        ],
      ) ,
    );
  }
}
