import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homework1/services/ffi_bridge.dart';

import '../services/platform_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
  final _service = PlatformService();
  FFIBridge bridge = FFIBridge();
  String cLength = 'тут должна быть длина строки';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Введите текст',
                ),
                onChanged: (text) {
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _textController.text.isNotEmpty
                    ? () {
                        _service.callSetText(_textController.text);
                        cLength =
                            'Длина строки ${bridge.getCLength(_textController.text).toString()}';
                        setState(() {});
                      }
                    : null,
                child: const Text('Нажать'),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: const AndroidView(
                  viewType: 'ANDROID_TEXTVIEW',
                  creationParamsCodec: StandardMessageCodec(),
                ),
              ),
              Text(cLength),
            ],
          ),
        ),
      ),
    );
  }
}
