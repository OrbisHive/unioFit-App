

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/utils/global_widgets.dart';

class TermsAndPolicyView extends StatefulWidget {
  static final String route = '/termsAndPolicyView';

  const TermsAndPolicyView({super.key});

  @override
  State<TermsAndPolicyView> createState() => _TermsAndPolicyViewState();
}

class _TermsAndPolicyViewState extends State<TermsAndPolicyView> {
  String? title;
  String? statement;

  @override
  void initState() {
    super.initState();
    title = Get.arguments["title"];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(title!= null && title == 'privacy_policy'){
        statement="<title>Privacy Policy</title>";
      }else if(title!= null && title == 'terms_and_condition'){
        statement="<title>Terms and Conditions</title>";

      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.appColors.bgCardGreyColor,
      appBar: AppBar(
        backgroundColor: R.appColors.bgCardGreyColor,
        leading: GlobalWidgets.buildBackButton(),
        leadingWidth: 20.w,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HtmlWidget(statement ?? ''),
            // buildParagraph(),
          ],
        ),
      ),
    );
  }
}