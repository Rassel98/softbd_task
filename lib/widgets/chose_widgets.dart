import 'package:flutter/material.dart';
import 'package:soft_bd_task/model/movie_model.dart';

class ChoseItem extends StatefulWidget {
  final MovieData movie;
  ChoseItem({Key? key, required this.movie}) : super(key: key);

  @override
  State<ChoseItem> createState() => _ChoseItemState();
}

class _ChoseItemState extends State<ChoseItem> {
  bool isClicked=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          isClicked=!isClicked;
        });
      },
      child: Card(
        //color: Colors.transparent,
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(widget.movie.imagePath!),
                ),
                if (isClicked)
                  Positioned(
                      top: 10,
                      right: 10,
                      child: Icon(
                        Icons.cloud_done_sharp,
                        color: Colors.green,
                      ))
              ],
            ),
            Flexible(child: Text(widget.movie.title!)),
          ],
        ),
      ),
    );
  }
}