import 'dart:io';
import 'dart:async';
import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ContentReciever extends StatefulWidget {
  const ContentReciever({key}) : super(key: key);

  @override
  State<ContentReciever> createState() {
    return _ContentRecieverState();
  }
}

class _ContentRecieverState extends State<ContentReciever> {
  late StreamSubscription _intentSub;
  final _sharedFiles = <SharedMediaFile>[];

  // TODO add to enum or config
  final String folder1 = "/storage/emulated/0/Pictures";
  final String folder2 = "/storage/emulated/0/Pictures/BubuDudu";
  final String folder3 = "/storage/emulated/0/Pictures/Asamimichan";

  @override
  void initState() {
    super.initState();
    var f = folder1;
    // Listen to media sharing coming from outside the app while the app is in the memory.
    _intentSub = ReceiveSharingIntent.instance.getMediaStream().listen((value) async {
      setState(() {
        _sharedFiles.clear();
        _sharedFiles.addAll(value);

        // Tell the library that we are done processing the intent.
        ReceiveSharingIntent.instance.reset();
      });
    }, onError: (err) {
      print(err);
    });

    // Get the media sharing coming from outside the app while the app is closed.
    ReceiveSharingIntent.instance.getInitialMedia().then((value) {
      setState(() {
        _sharedFiles.clear();
        _sharedFiles.addAll(value);
        
        // Tell the library that we are done processing the intent.
        ReceiveSharingIntent.instance.reset();
      });
    });
  }

  Future printPermissionStatus() async {
    // You can request multiple permissions at once.
    final Map<Permission, PermissionStatus> statuses = await [
      Permission.manageExternalStorage,
      Permission.photos
    ].request();
  }

  Future<String> get _localPath async {

    // getDownloadsDirectory()
    // /storage/emulated/0/Android/data/com.example.first_app/files/downloads
    
    //Get external storage directory  
    //var directory = await getExternalStorageDirectory(); //also plural
    // /storage/emulated/0/Android/data/com.example.first_app/files

    //Check if external storage not available. If not available use   
    //internal applications directory
    // var directory = await getApplicationDocumentsDirectory();
    // /data/user/0/com.example.first_app/app_flutter

    //return directory.path;
    
    Directory generalDownloadDir = Directory('/storage/emulated/0/Pictures/Facebook');
    return generalDownloadDir.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/sample.jpg');
  }

  Future<File> writeString(String data) async {
    final file = await _localFile;
    return file.writeAsString('$data\n', mode: FileMode.append);
  }

  Future<File> writeBytes(Uint8List data) async {
    final file = await _localFile;
    return file.writeAsBytes(data, mode: FileMode.write, flush: true);
  }

  Future<void> onButtonPressed(folder) async {
    // loop all files which are shared
    // list of files
    // List mappedList = await Future.wait(_sharedFiles.map((f) async => {
    // }));
    print("111111111111");
    var f = _sharedFiles[0];

    File sourceFile = File(f.path);
    final contents = await sourceFile.readAsBytes();
    final String targetFileName = basename(sourceFile.path);

    Directory generalDownloadDir = Directory(folder);
    final path = generalDownloadDir.path;
    final File targetFile = File('$path/$targetFileName');

    await targetFile.writeAsBytes(contents, mode: FileMode.write, flush: true);

    print("22222222222222222");

    // _sharedFiles.map((f) => () async {
    //     await this.printPermissionStatus();

    //     File sourceFile = File(f.path);
    //     final contents = await sourceFile.readAsBytes();
    //     final String targetFileName = basename(sourceFile.path);

    //     Directory generalDownloadDir = Directory(folder);
    //     final path = generalDownloadDir.path;
    //     final File targetFile = File('$path/$targetFileName');

    //     return await targetFile.writeAsBytes(contents, mode: FileMode.write, flush: true);
    // });

    setState(() {
      _sharedFiles.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    const textStyleBold = TextStyle(fontWeight: FontWeight.bold);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: [
              Text("Shared files:", style: textStyleBold),
              Text(_sharedFiles
                      .map((f) => f.toMap())
                      .join(",\n****************\n")),
              //const SizedBox(height: 20),
              TextButton(
                onPressed: () async => onButtonPressed(folder1), 
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 28)
                ),
                child: const Text('Facebook folder')
              ),
              //const SizedBox(height: 20),
              TextButton(
                onPressed: () async => onButtonPressed(folder2), 
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 28)
                ),
                child: const Text('Bubu & Dudu')
              ),
              //const SizedBox(height: 20),
              TextButton(
                onPressed: () async => onButtonPressed(folder3), 
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 28)
                ),
                child: const Text('Asamimi')
              ),
            ],
          )
        )
      )
    );
  }

  @override
  void dispose() {
    _intentSub.cancel();
    super.dispose();
  }
}