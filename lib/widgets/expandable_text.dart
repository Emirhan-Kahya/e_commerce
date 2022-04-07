import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimension.dart';
import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf, secondHalf;
  bool hiddenText = true;
  double textHeight = Dimension.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if(widget.text.length > textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    }
    else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty ? mSmallText(text: firstHalf, size: Dimension.font16) : Column(
        children: [
          mSmallText(height: 1.8,text: hiddenText ? (firstHalf + "..."): (firstHalf + secondHalf), size: Dimension.font16, color: AppColors.paraColor,),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText =! hiddenText;
              });
            },
            child: Row(
              children: [
                mSmallText(text: "Show more", color: AppColors.mainColor),
                Icon(hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up, color: AppColors.mainColor,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
