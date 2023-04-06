import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';


class PlatformWidget extends StatelessWidget {
  const PlatformWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final Widget view;
    if(defaultTargetPlatform==TargetPlatform.android){
      view=AndroidView(
          viewType: 'INTEGRATION_ANDROID',
      onPlatformViewCreated: _onPlatformViewCreated,);
      /*const viewType = 'INTEGRATION_ANDROID';
      final Map<String, dynamic> creationParams = <String, dynamic>{};

      view = PlatformViewLink(
          viewType: viewType,
          surfaceFactory: (BuildContext context, PlatformViewController controller) {
            return AndroidViewSurface(
              controller: controller as AndroidViewController,
              gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
              hitTestBehavior: PlatformViewHitTestBehavior.opaque,
            );
          },
          onCreatePlatformView: (PlatformViewCreationParams params) {
            return PlatformViewsService.initSurfaceAndroidView(
              id: params.id,
              viewType: viewType,
              layoutDirection: TextDirection.ltr,
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
              onFocus: () {
                params.onFocusChanged(true);
              },
            )
              ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
              ..create();
          });*/
    }
    return SizedBox(height: 50, width: 200, child: view);
  }


  void _onPlatformViewCreated(int id) {
    if (kDebugMode) {
      print('PlatformView with id:$id created');
    }
  }
}
