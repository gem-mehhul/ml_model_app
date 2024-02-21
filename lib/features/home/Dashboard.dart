import 'package:flutter/material.dart';
import 'package:ml_model_app/core/reusableWidgets/videoController.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

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

Future<void> predDate(String videoUrl) async {
  try {
    print('line 22-----');
    // Download the video file from the URL
    var response = await http.get(Uri.parse(videoUrl));
    print('line 25------${response.statusCode}');
    if (response.statusCode == 200) {
      // Convert the response body to a Uint8List
      print('line 27------${response.body}');
      var videoData = response.bodyBytes;

      // Preprocess the video data as needed (e.g., normalize, scale)
      var processedData = preprocessVideoData(videoData);
      print('line 30------${processedData}');

      // Load the TensorFlow Lite model from asset
      final interpreter = await Interpreter.fromAsset('assets/predData.tflite');

      // Prepare the output list
      var output = <List<double>>[List.filled(100, 0)];

      // Run inference
      interpreter.run(processedData, output);

      // Print the output
      print(output);
    } else {
      print('Failed to download video: ${response.statusCode}');
    }
  } catch (e) {
    // Handle the error (e.g., display an error message)
    print('Error: $e');
  }
}

// Preprocess video data (replace this with your actual preprocessing logic)
List<double> preprocessVideoData(Uint8List videoData) {
  // Example preprocessing: normalize the video data
  var normalizedData = videoData.map((value) => value / 255.0).toList();
  return normalizedData;
}
// Future<void> predDate(String link) async {
//   // Load the TensorFlow Lite model from asset
//   final interpreter = await Interpreter.fromAsset('assets/predData.tflite');

//   // Parse the input link string and convert it to a list of float32 values
//   var input = link.split(',').map((e) => double.parse(e)).toList();
//   // Note: Adjust the splitting logic based on the format of your input data

//   // Convert the input list to a Float32List
//   var inputFloat32 = Float32List.fromList(input);

//   // Prepare the output list
//   var output = <List<double>>[List.filled(100, 0)];

//   // Run inference
//   interpreter.run(inputFloat32, output);

//   // Print the output
//   print(output);
// }

List<VideoList> _videoList = [
  VideoList(
      id: 1,
      link:
          "https://firebasestorage.googleapis.com/v0/b/ml-model-30157.appspot.com/o/6E400002-B5A3-F393-E0A9-E50E24DCCA9E-ba9ff882-2728-482a-888d-9147a8dc5b1e-20240215093838.mp4?alt=media&token=71118e76-0a74-4624-a1b5-c8862d5e3605"),
  VideoList(
      id: 2,
      link:
          "https://firebasestorage.googleapis.com/v0/b/ml-model-30157.appspot.com/o/6E400002-B5A3-F393-E0A9-E50E24DCCA9E-ba9ff882-2728-482a-888d-9147a8dc5b1e-20240215094600.mp4?alt=media&token=a73eebf2-8ecb-4283-897f-6fa13147b9f0"),
  VideoList(
      id: 3,
      link:
          "https://firebasestorage.googleapis.com/v0/b/ml-model-30157.appspot.com/o/6E400002-B5A3-F393-E0A9-E50E24DCCA9E-ba9ff882-2728-482a-888d-9147a8dc5b1e-20240215095328.mp4?alt=media&token=9167c4ee-a1d8-461c-9b55-a56ddbb8d9c1"),
  VideoList(
      id: 4,
      link:
          "https://firebasestorage.googleapis.com/v0/b/ml-model-30157.appspot.com/o/6E400002-B5A3-F393-E0A9-E50E24DCCA9E-ba9ff882-2728-482a-888d-9147a8dc5b1e-20240215095838.mp4?alt=media&token=ae536bd1-3a85-4406-9202-38151fad0863"),
  VideoList(
      id: 5,
      link:
          "https://firebasestorage.googleapis.com/v0/b/ml-model-30157.appspot.com/o/6E400002-B5A3-F393-E0A9-E50E24DCCA9E-ba9ff882-2728-482a-888d-9147a8dc5b1e-20240215100519.mp4?alt=media&token=ab6a5a95-3078-4b38-94a7-727c6ac6e124"),
  VideoList(
      id: 6,
      link:
          "https://firebasestorage.googleapis.com/v0/b/ml-model-30157.appspot.com/o/6E400002-B5A3-F393-E0A9-E50E24DCCA9E-ba9ff882-2728-482a-888d-9147a8dc5b1e-20240215101137.mp4?alt=media&token=84559dc9-57a5-4c45-80b3-1b0d9feaf0eb"),
  VideoList(
      id: 7,
      link:
          "https://firebasestorage.googleapis.com/v0/b/ml-model-30157.appspot.com/o/6E400002-B5A3-F393-E0A9-E50E24DCCA9E-ba9ff882-2728-482a-888d-9147a8dc5b1e-20240215102029.mp4?alt=media&token=7fd4a231-a5e4-454d-b5d5-0669ea5970bb"),
  VideoList(
      id: 8,
      link:
          "https://firebasestorage.googleapis.com/v0/b/ml-model-30157.appspot.com/o/6E400002-B5A3-F393-E0A9-E50E24DCCA9E-ba9ff882-2728-482a-888d-9147a8dc5b1e-20240215102839.mp4?alt=media&token=34ebcfc7-28e4-40db-8696-082a3c06e1e6"),
  VideoList(
      id: 9,
      link:
          "https://firebasestorage.googleapis.com/v0/b/ml-model-30157.appspot.com/o/6E400002-B5A3-F393-E0A9-E50E24DCCA9E-ba9ff882-2728-482a-888d-9147a8dc5b1e-20240215103339.mp4?alt=media&token=d971b8fd-ba92-49a7-808a-6c22fec1c02c"),
  VideoList(
      id: 10,
      link:
          "https://firebasestorage.googleapis.com/v0/b/ml-model-30157.appspot.com/o/6E400002-B5A3-F393-E0A9-E50E24DCCA9E-ba9ff882-2728-482a-888d-9147a8dc5b1e-20240215104010.mp4?alt=media&token=1f590751-1770-49da-91ec-f27c57b3302a"),
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
          return Column(
            children: [
              Container(
                  child: InkWell(
                child: Container(
                  height: 200 * pageRatio,
                  width: 400 * pageRatio,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),

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
              )),
              ElevatedButton(
                  onPressed: () {
                    print('line 112----id: ----${_videoList[index].id}');
                    predDate(_videoList[index].link);
                    // Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                       builder: (context) =>
                    //                           const ForgotPassword()));
                  },
                  child: Container(
                    child: Text('Predict'),
                  ))
            ],
          );
        });
  }
}
