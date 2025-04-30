
import 'package:billDeskSDK/sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SDKResponseHandler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _launchSDK() {
    final flowConfig = {

      "merchantId": "Enter Merchant ID",
      "bdOrderId": "Enter bdOrderID",
      "childWindow": false,
      "returnUrl": "Enter valid https Return Url",
      "authToken":
          "Enter OAuth Token"
    };

    final sdkConfigMap = {
      "flowConfig": flowConfig,
      "flowType": "payments",
      "merchantLogo": ""
    };
    ResponseHandler responseHandler = SdkResponseHandler();
    final sdkConfig = SdkConfig(
        sdkConfigJson: SdkConfiguration.fromJson(sdkConfigMap),
        responseHandler: responseHandler,
        isUATEnv: true,
        isDevModeAllowed: true,//
        isJailBreakAllowed: false,
    );

    SDKWebView.openSDKWebView(sdkConfig);
    print("Invoked Billdesk SDK with: ");
    print("flowConfig : $flowConfig");
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _launchSDK,
        tooltip: 'Launch SDK demo',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
