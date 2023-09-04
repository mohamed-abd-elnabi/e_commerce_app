import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';

import '../../../../../core/resources/managar_font_size.dart';
import '../../../../../core/resources/manager_text_styles.dart';

class ExpandableText extends StatefulWidget {
  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Text(
        'Exercitationem neque aut architecto eum. '
        'Ea blanditiis aliquid odit ipsa. Alias qui minus quia similique voluptas'
        ' sit doloremque. Harum eaque officia reiciendis '
        'sit beatae voluptatem. Inventore sequi expedita maiores aliquid et pariatur.',
        style: getRegularTextStyle(
          color: ManagerColors.grey,
          fontSize: ManagerFontSize.s14,
        ),
        maxLines: isExpanded ? null : 4,
        overflow: isExpanded ? null : TextOverflow.ellipsis,
      ),
    );
  }
}
