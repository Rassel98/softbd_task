import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soft_bd_task/provider/softbd_task_provider.dart';
import 'package:soft_bd_task/view/movie_details_page.dart';
import 'package:soft_bd_task/widgets/drawar.dart';

class HomePage extends StatelessWidget {
  static const String routeName='/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<SoftbdTaskProvider>(context,listen: false);
    provider.getMovieData();
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: const Text('Hello Good Morning',style: TextStyle(fontSize: 16,color: Colors.black),),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search,size: 30,color: Colors.black,))
        ],
      ),
      drawer: const MyDrawer(),

      drawerScrimColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
              Text('Featured Movie',style: TextStyle(color: Colors.black,fontSize: 16),),
                Row(mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Show All'),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_right))
                  ],
                )

            ],),
            SizedBox(
              height: 190,
              child: Consumer<SoftbdTaskProvider>(
                builder: (context, provider, _) =>provider.isLoading?ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: provider.movieModel!.data!.length,
                  itemBuilder: (context, index) {
                    final movie=provider.movieModel!.data![index];
                    return GestureDetector(
                      onTap: ()=>Navigator.pushNamed(context, MovieDetailsPage.routeName,arguments: movie),
                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.network(movie.imagePath!,height: 100,width: 100,fit: BoxFit.cover,),
                                Positioned(
                                  left: 0,
                                    top: 2,

                                    child: Row(
                                  children: const [
                                    Icon(Icons.star,color: Colors.white,),
                                    SizedBox(width: 2,),
                                    Text('9.8',style: TextStyle(color: Colors.white),)
                                  ],
                                ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text('Year : 1990'),
                                Icon(Icons.favorite)
                            ],),
                            SizedBox(height: 5,),
                            Text(movie.title!),

                            SizedBox(height: 5,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.timer),
                                  SizedBox(height: 2,),
                                  Text('1h 30m')
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.person),
                                  SizedBox(height: 2,),
                                  Text('5k')
                                ],
                              ),
                            ],
                            )

                          ],
                        )
                      ),
                    );

                  },

                ):const Center(child: CircularProgressIndicator(),) ,
              ),
            ),
          ],
        ),
      ),

    );
  }
}
