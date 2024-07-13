import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_modular/flutter_modular.dart';

class QRCodeCameraScreen extends StatefulWidget {
  const QRCodeCameraScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QRCodeCameraScreenState createState() => _QRCodeCameraScreenState();
}

class _QRCodeCameraScreenState extends State<QRCodeCameraScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      _cameraController = CameraController(cameras![0], ResolutionPreset.high);
      await _cameraController?.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Code Camera')),
      body: Column(
        children: [
          if (_isCameraInitialized)
            Expanded(
              child: CameraPreview(_cameraController!),
            )
          else
            const Center(child: CircularProgressIndicator()),
          ElevatedButton(
            onPressed: () async {
              try {
                await _cameraController?.takePicture().then((XFile? file) {
                  if (file != null) {
                    Modular.to.navigate('/nextScreen', arguments: file.path);
                  }
                });
              } catch (e) {
                print(e);
              }
            },
            child: const Text('Take Picture'),
          ),
        ],
      ),
    );
  }
}