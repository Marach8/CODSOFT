import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_todo_list_app/constants/colors.dart';
import 'package:task1_todo_list_app/constants/fontsizes.dart';
import 'package:task1_todo_list_app/constants/fontweights.dart';
import 'package:task1_todo_list_app/constants/strings.dart';
import 'package:task1_todo_list_app/functions/bloc/app_bloc.dart';
import 'package:task1_todo_list_app/functions/bloc/app_events.dart';
import 'package:task1_todo_list_app/widgets/custom_widgets/decorated_text_widget.dart';

class CompletedTodosHeading extends StatelessWidget {
  const CompletedTodosHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const DecoratedText(
          text: completedTasks, 
          color: purpleColor, 
          fontSize: fontSize3, 
          fontWeight: fontWeight4
        ),
        IconButton(
          onPressed: () => context.read<AppBloc>().add(
            const HideCompletedTodosAppEvent()
          ), 
          icon: const Icon(Icons.cancel_rounded)
        )
      ],
    );
  }
}