import 'package:flutter/material.dart';
import 'package:ml_model_app/core/reusableWidgets/videoController.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class VideoList {
  late int id;
  late String link;
  VideoList({required this.id, required this.link});
}

List<VideoList> _videoList = [
 
  VideoList(
      id: 1,
      link:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
  VideoList(
      id: 2,
      link:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
  VideoList(
      id: 3,
      link:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
  VideoList(
      id: 4,
      link:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
  VideoList(
      id: 5,
      link:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
  VideoList(
      id: 6,
      link:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
  VideoList(
      id: 7,
      link:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
  VideoList(
      id: 8,
      link:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
  VideoList(
      id: 9,
      link:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
  VideoList(
      id: 10,
      link:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
  // VideoList(
  //     id: 14,
  //     link: 'https://athena-data-devenv.s3.ap-south-1.amazonaws.com/14.mp4'),
  // VideoList(
  //     id: 15,
  //     link: 'https://athena-data-devenv.s3.ap-south-1.amazonaws.com/15.mp4'),
];

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;

    double pageRatio = MediaQuery.of(context).size.width / baseWidth;

    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
              child: InkWell(
            child: Container(
              height: 200 * pageRatio,
              width: 400 * pageRatio,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),

              child: VideoPlayer(
                movieLink: _videoList[index].link,
                //  'https://athena-data-devenv.s3.ap-south-1.amazonaws.com/1661342903593_mp4',
              ),

              // child: Center(
              //     child: Icon(
              //   Icons.play_arrow,
              //   size: 50,
              // )),
              margin: EdgeInsets.all(20 * pageRatio),
              //child: VideoPlayer(movieLink: ''),
            ),
          ));
        });
  }
}
