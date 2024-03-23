import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../sign_in/views/widgets/body_subtitle_text.dart';
import '../../../sign_in/views/widgets/headline_title_text.dart';
import '../../controllers/home_controller.dart';
import '../../models/home_success_response_model.dart';

class HomeMobilePortrait extends GetView<HomeController> {
  const HomeMobilePortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeadlineTitleText(primaryText: 'Secret Message:'),
            FutureBuilder<HomeSuccessResponseModel?>(
              future: controller.getHomeSecret(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                } else if (snapshot.hasData) {
                  var body = snapshot.data!.data;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: BodySubTitleText(
                      primaryText: body.secret.toString(),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  return SizedBox(
                    height: Get.height * .08,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child:
                        SpinKitWave(
                          itemBuilder: (BuildContext context, int index) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            );
                          },
                          type: SpinKitWaveType.start,
                          size: 24.0,
                          itemCount: 5,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
