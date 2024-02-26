import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/constants/fontsizes.dart';
import 'package:task3_quiz_app/src/utils/constants/fontweights.dart';
import 'package:task3_quiz_app/src/utils/constants/strings.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';
import 'package:task3_quiz_app/src/utils/widgets/custom_widgets/subcategory_container.dart';
import 'package:task3_quiz_app/src/utils/widgets/other_widgets/empty_container.dart';
import 'package:task3_quiz_app/src/utils/widgets/other_widgets/list_tile_leading_widget.dart';

class QuizSubCategory extends StatefulWidget {
  final List<String> children;
  final String typeHeading, 
  typeDescription;

  const QuizSubCategory({
    super.key,
    required this.children,
    required this.typeHeading,
    required this.typeDescription
  });

  @override
  State<QuizSubCategory> createState() => _QuizSubCategoryState();
}

class _QuizSubCategoryState extends State<QuizSubCategory> {
  bool _showFirst = true;
  String? _selectedSubcategory,
  _trackSelectedCat;


  @override
  Widget build(BuildContext context) {
    
    WidgetsBinding.instance.addPostFrameCallback((_){
      _selectedSubcategory.optionalCheckAndSet(
        context: context,
        tracker: _trackSelectedCat
      );
    });

    return GestureDetector(
      onTap: () => setState(() => _showFirst = !_showFirst),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: AnimatedCrossFade(
          firstChild: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.typeHeading,).decorateWithGoogleFont(
                  blackColor,
                  fontWeight4,
                  fontSize4
                ),
                const Gap(10),
                Text(widget.typeDescription).decorateWithGoogleFont(                  
                  blackColor,
                  fontWeight3,
                  fontSize2
                ),
                const Gap(10),
                _selectedSubcategory != null ? GestureDetector(
                  onTap: () {
                    _trackSelectedCat = _selectedSubcategory;
                    setState(() => _selectedSubcategory = null);
                  },
                  child: Text(
                    youSelected + _selectedSubcategory! + tapToDeselect
                  ).decorateWithGoogleFont(
                    greenColor,
                    fontWeight9,
                    fontSize1
                  ),
                ) : emptySizedBox
              ],
            ),
          ),

          secondChild: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.children.map(
                  (child) {
                    return SubCategoryContainer(
                      onTap: (){
                        child.checkAndSet(context: context);
                        setState(() {
                          _selectedSubcategory = child;
                          _showFirst = !_showFirst;
                        });
                      },
                      child: Row(
                        children: [
                          ListTileLeadingWidget(
                            listIndex: (widget.children.indexOf(child) + 1).toString()
                          ),
                          const Gap(10),
                          Text(child).decorateWithGoogleFont(
                            blackColor,
                            fontWeight4,
                            fontSize2
                          ),
                        ],
                      ),
                    );
                  }
                ).toList()
              ),
            )
          ),
          crossFadeState: _showFirst ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
          firstCurve: Curves.decelerate,
          secondCurve: Curves.decelerate,
          sizeCurve: Curves.decelerate,
          duration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}