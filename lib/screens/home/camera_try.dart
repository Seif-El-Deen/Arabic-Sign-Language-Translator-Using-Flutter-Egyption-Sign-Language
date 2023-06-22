import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import "package:http/http.dart" as http;
import 'package:image_picker/image_picker.dart';

class VideoCaptureScreen extends StatefulWidget {
  @override
  _VideoCaptureScreenState createState() => _VideoCaptureScreenState();
}

class _VideoCaptureScreenState extends State<VideoCaptureScreen> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  int _countdownSeconds = 3;
  bool _isCountdownActive = false;
  bool videoCaptureStarted = false;
  XFile? file;
  String? message = "";

  String serverUrl =
      "https://21ea-156-195-240-173.ngrok-free.app/process_video";

  @override
  void initState() {
    super.initState();
    _setupCamera();
  }

  Future<void> _setupCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras[0], ResolutionPreset.high);
    await _controller.initialize();
    setState(() {});
  }

  void _startCountdown() {
    _isCountdownActive = true;
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_countdownSeconds > 1) {
          _countdownSeconds--;
        } else {
          timer.cancel();
          _countdownSeconds = 3;
          _isCountdownActive = false;
          _captureVideo();
        }
      });
    });
  }

  void _captureVideo() async {
    // XFile file =
    videoCaptureStarted = true;
    setState(() {});
    await _controller.startVideoRecording();
    // Handle the captured video file
  }

  void _stopVideo() async {
    videoCaptureStarted = false;
    setState(() {});
    file = await _controller.stopVideoRecording();
    print(file!.path);
  }

  uploadImage() async {
    final request = http.MultipartRequest("POST", Uri.parse(serverUrl));
    // final headers = {"Content-type": "multipart/form-data"};

    request.files.add(await http.MultipartFile.fromPath('video', file!.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      String val = await response.stream.bytesToString();
      print(val);
    } else {
      throw Exception('Failed to upload video');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Capture'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CameraPreview(_controller),
          ),
          const SizedBox(height: 16),
          _isCountdownActive
              ? Text(
                  '$_countdownSeconds',
                  style: const TextStyle(fontSize: 48),
                )
              : ElevatedButton(
                  onPressed: videoCaptureStarted ? _stopVideo : _startCountdown,
                  child: const Text('Record Video'),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final picker = ImagePicker();
          final pickedFile = await picker.getVideo(
            source: ImageSource.gallery,
          );
          if (pickedFile != null) {
            File file = File(pickedFile.path);
            print(pickedFile.path);

            print(file);

            final request = http.MultipartRequest("POST", Uri.parse(serverUrl));
            // final headers = {"Content-type": "multipart/form-data"};

            request.files
                .add(await http.MultipartFile.fromPath('video', file.path));

            var response = await request.send();

            if (response.statusCode == 200) {
              String val = await response.stream.bytesToString();
              print(val);
            } else {
              throw Exception('Failed to upload video');
            }
          }
        },
        child: const Icon(Icons.circle),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
