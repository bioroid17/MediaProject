import 'package:batta/model/model_daumpostcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DaumPostcodeSearchScreen extends StatefulWidget {
  const DaumPostcodeSearchScreen({super.key});

  @override
  State<DaumPostcodeSearchScreen> createState() =>
      _DaumPostcodeSearchScreenState();
}

class _DaumPostcodeSearchScreenState extends State<DaumPostcodeSearchScreen> {
  final InAppLocalhostServer _localhostServer = InAppLocalhostServer();
  late InAppWebViewController _controller;
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    _localhostServer.start();
  }

  @override
  void dispose() {
    _localhostServer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("다음 주소 검색"),
          backgroundColor: const Color.fromARGB(255, 13, 32, 101),
          shadowColor: Colors.grey,
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                  url: Uri.parse(
                      "http://localhost:8080/assets/html/daum_postcode.html")),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  useShouldOverrideUrlLoading: true,
                  mediaPlaybackRequiresUserGesture: false,
                ),
                android: AndroidInAppWebViewOptions(
                  useHybridComposition: true,
                ),
                ios: IOSInAppWebViewOptions(
                  allowsInlineMediaPlayback: true,
                ),
              ),
              onWebViewCreated: (controller) {
                _controller = controller;
                _controller.addJavaScriptHandler(
                    handlerName: 'onSelectAddress',
                    callback: (args) {
                      Map<String, dynamic> fromMap = args.first;
                      DaumPostModel data = _dataSetting(fromMap);
                      Navigator.of(context).pop(data);
                    });
              },
              onLoadStop: (controller, url) {
                setState(() {
                  if (_localhostServer.isRunning()) {
                    isLoading = false;
                  } else {
                    _localhostServer.start().then((value) {
                      _controller.reload();
                    });
                  }
                });
              },
              onLoadError: ((controller, url, code, message) {
                // logger.e(message);
                setState(() {
                  isError = true;
                });
              }),
              onLoadHttpError: (controller, url, statusCode, description) {
                // logger.e(description);
                setState(() {
                  isError = true;
                });
              },
              androidOnPermissionRequest:
                  (controller, origin, resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
            ),
            if (isLoading) ...[
              const SizedBox(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
            if (isError) ...[
              Container(
                color: const Color.fromRGBO(71, 71, 71, 1),
                child: const Center(
                  child: Text(
                    "페이지를 찾을 수 없습니다",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  DaumPostModel _dataSetting(Map<String, dynamic> map) {
    return DaumPostModel(
      map["address"],
      map["roadAddress"],
      map["jibunAddress"],
      map["sido"],
      map["sigungu"],
      map["bname"],
      map["roadname"],
      map["buildingName"],
      map["addressEnglish"],
      map["roadAddressEnglish"],
      map["jibunAddressEnglish"],
      map["sidoEnglish"],
      map["sigunguEnglish"],
      map["bnameEnglish"],
      map["roadnameEnglish"],
      map["zonecode"],
      map["sigunguCode"],
      map["bcode"],
      map["buildingCode"],
      map["roadnameCode"],
      map["addressType"],
      map["apartment"],
      map["userLanguageType"],
      map["userSelectedType"],
    );
  }
}
