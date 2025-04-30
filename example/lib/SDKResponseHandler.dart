import 'package:billDeskSDK/sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SdkResponseHandler implements ResponseHandler {
  @override
  void onError(SdkError sdkError) {
    Get.defaultDialog(
      title: 'Sdk Internal Error',
      middleText: '$sdkError',
      confirm: ElevatedButton(
        onPressed: () {
          // Handle error dismissal logic here if needed
          Get.back();
        },
        child: const Text('Dismiss'),
      ),
    );
  }

  @override
  Future<void> onTransactionResponse(TxnInfo txnInfoMap) async {
    // Handle transaction response here
    // You can customize the transaction response handling logic based on your requirements
    // Example: Show transaction details in a custom dialog
    // You can access transaction details like txnInfoMap.txnInfoMap["keyName"]
    String merchantId = '${txnInfoMap.txnInfoMap["merchantId"]}';
    String orderId = '${txnInfoMap.txnInfoMap["orderId"]}';
    Get.dialog(
      Dialog(
        child: Column(
          children: [
            Text('Merchant ID: $merchantId'),
            Text('Order ID: $orderId'),
            // Add more transaction details as needed
            ElevatedButton(
              onPressed: () {
                // Handle button press logic here if needed
                Get.back();
              },
              child: const Text('Dismiss'),
            ),
          ],
        ),
      ),
    );
  }
}
