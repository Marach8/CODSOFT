import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task1_todo_list_app/bloc/app_bloc.dart';
import 'package:task1_todo_list_app/bloc/app_events.dart';
import 'package:task1_todo_list_app/constants/colors.dart';
import 'package:task1_todo_list_app/constants/fontsizes.dart';
import 'package:task1_todo_list_app/constants/fontweights.dart';
import 'package:task1_todo_list_app/widets/custom_widgets/decorated_text_widget.dart';

class ListTileTrailingWiget extends StatelessWidget {
  final bool? isCompleted;
  final List<String> todoToUpdate;

  const ListTileTrailingWiget({
    super.key,
    required this.isCompleted,
    required this.todoToUpdate
  });

  @override
  Widget build(BuildContext context) {
    final dueDateTime = todoToUpdate[1];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 50,
          child: DecoratedText(
            text: dueDateTime, 
            color: blackColor.withOpacity(0.5), 
            fontSize: fontSize1, 
            fontWeight: fontWeight5,
            controlOverflow: true,
          ),
        ),
        const Gap(15),
        SizedBox(
          height: 1,
          width: 1,
          child: Checkbox(
            activeColor: purpleColor,
            value: isCompleted, 
            onChanged: (value){
              todoToUpdate.insert(3, value.toString());
              final todoIndex = todoToUpdate.last;
              context.read<AppBloc>().add(
                UpdateTodoIsCompletedStateAppEvent(
                  indexToUpdate: todoIndex,
                  newTodo: todoToUpdate
                )
              );
            },
          ),
        )
      ],
    );
  }
}
// value: isCompleted,
                  // onChanged: (value){
                  //   final newTodo = [
                  //     title, 
                  //     dueDateTime,
                  //     content,
                  //     value.toString(),
                  //     creationDateTime,
                  //     todoIndex
                  //   ];
                  //   context.read<AppBloc>().add(
                  //     UpdateTodoIsCompletedState(
                  //       indexToUpdate: todoIndex,
                  //       newTodo: newTodo
                  //     )
                  //   );
                  // },