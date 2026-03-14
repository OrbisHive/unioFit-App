import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';
class SupportChatScreen extends StatefulWidget {
  const SupportChatScreen({super.key});
  @override
  State<SupportChatScreen> createState() => _SupportChatScreenState();
}

class _SupportChatScreenState extends State<SupportChatScreen> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  late final List<Map<String, dynamic>> messages = [
    {
      "message": "support_greeting_message".L(),
      "isUser": false,
      "time": "10:00 AM"
    }
  ];

  void sendMessage() {

    if (controller.text.trim().isEmpty) return;

    setState(() {
      messages.add({
        "message": controller.text,
        "isUser": true,
        "time": TimeOfDay.now().format(context)
      });
    });

    controller.clear();

    Future.delayed(const Duration(milliseconds: 100), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        title: Row(
          children: [

            CircleAvatar(
              radius: 18,
              backgroundColor: R.appColors.primary,
              child: const Icon(Icons.support_agent,color: Colors.white),
            ),

            SizedBox(width: 3.w),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "support_chat".L(),
                  style: R.textStyles.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? R.appColors.white
                        : R.appColors.black,
                  ),
                ),

                Text(
                  "support_online".L(),
                  style: R.textStyles.poppins(
                    fontSize: 11.sp,
                    color: Colors.green,
                  ),
                ),

              ],
            )
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [

            /// Chat Messages
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 2.h,
                ),
                itemCount: messages.length,
                itemBuilder: (context, index) {

                  final msg = messages[index];
                  bool isUser = msg["isUser"];

                  return Align(
                    alignment: isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 1.5.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 1.5.h,
                      ),
                      constraints: BoxConstraints(
                        maxWidth: 75.w,
                      ),
                      decoration: BoxDecoration(
                        color: isUser
                            ? R.appColors.primary
                            : (isDark
                            ? R.appColors.darkSurface
                            : Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                          Text(
                            msg["message"],
                            style: R.textStyles.poppins(
                              fontSize: 14.5.sp,
                              color: isUser
                                  ? Colors.white
                                  : (isDark
                                  ? Colors.white
                                  : Colors.black),
                            ),
                          ),

                          SizedBox(height: .5.h),

                          Text(
                            msg["time"],
                            style: R.textStyles.poppins(
                              fontSize: 10.sp,
                              color: isUser
                                  ? Colors.white70
                                  : Colors.grey,
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            /// Chat Input Bar
            Container(
              padding: EdgeInsets.only(
                left: 3.w,
                right: 2.w,
                top: 1.h,
                bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? 1.h : 2.h,
              ),
              decoration: BoxDecoration(
                color: isDark
                    ? R.appColors.darkSurface
                    : Colors.white,

              ),
              child: Row(
                children: [

                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: R.textStyles.poppins(
                        fontSize: 15.sp,
                        color: const Color(0xFF1A1A1A), // text color
                      ),
                      decoration: InputDecoration(
                        hintText: "type_a_message".L(),
                        hintStyle: R.textStyles.poppins(
                          fontSize: 15.sp,
                          color: const Color(0xFF1A1A1A).withOpacity(0.6),
                        ),

                        filled: true,
                        fillColor: const Color(0xFFF5F5F5),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 2.w),

                  CircleAvatar(
                    radius: 22,
                    backgroundColor: R.appColors.primary,
                    child: IconButton(
                      icon: const Icon(Icons.send,color: Colors.white),
                      onPressed: sendMessage,
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}