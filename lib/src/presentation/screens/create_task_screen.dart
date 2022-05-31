import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/blocs/create_task/create_task_bloc.dart';
import 'package:todo_app/src/core/state/base_state.dart';
import 'package:todo_app/src/di/injector_setup.dart';
import 'package:todo_app/src/presentation/components/todo_button.dart';
import 'package:todo_app/src/presentation/components/todo_text_field.dart';

class CreateTaskScreen extends StatefulWidget {
  final String? restorationId;

  const CreateTaskScreen({Key? key, this.restorationId}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends BaseState<CreateTaskScreen> {
  final _titleController = TextEditingController();
  final _desController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget buildBody() {
    return BlocProvider(
      create: (_) => CreateTaskBloc(injector()),
      child: BlocConsumer<CreateTaskBloc, CreateTaskState>(
        listener: (context, state) {
          if (state is OnDateChangedState) {
            if (state.isStartDate) {
              _startDate = state.dateTime;
              if (_endDate != null && _startDate!.isAfter(_endDate!)) {
                _endDate = _startDate;
                _endDateController.text =
                    '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}';
              }
              _startDateController.text =
                  '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}';
            } else {
              _endDate = state.dateTime;
              _endDateController.text =
                  '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}';
            }
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
              child: Column(
                children: [
                  TodoTextField(
                    controller: _titleController,
                    hintText: 'Your task title',
                    labelText: 'Title *',
                  ),
                  const SizedBox(height: 20.0),
                  TodoTextField(
                    controller: _desController,
                    hintText: 'Your task description',
                    labelText: 'Description',
                    maxLines: 10,
                    isRequired: false,
                  ),
                  const SizedBox(height: 20.0),
                  TodoTextField(
                    onTap: () => _onHandleDate(
                      context,
                      startDate: null,
                      currentDate: _startDate,
                    ),
                    controller: _startDateController,
                    hintText: 'DD/MM/YYYY',
                    labelText: 'Start date *',
                    isReadOnly: true,
                  ),
                  const SizedBox(height: 20.0),
                  TodoTextField(
                    onTap: () => _onHandleDate(
                      context,
                      startDate: _startDate,
                      currentDate: _endDate,
                      isStartDate: false,
                    ),
                    controller: _endDateController,
                    hintText: 'DD/MM/YYYY',
                    labelText: 'End date *',
                    isReadOnly: true,
                  ),
                  const SizedBox(height: 20.0),
                  TodoButton(onPressed: _onHandlePressed),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  String get appBarTitle => 'Create new task';

  void _onHandleDate(
    BuildContext context, {
    DateTime? startDate,
    DateTime? currentDate,
    bool isStartDate = true,
  }) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: startDate ?? DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (pickedDate != null && pickedDate != currentDate) {
      context
          .read<CreateTaskBloc>()
          .add(OnDateChanged(pickedDate, isStartDate));
    }
  }

  void _onHandlePressed() {
    if (_formKey.currentState!.validate()) {
      print(
          '${_titleController.text} - ${_desController.text} - ${_startDateController.text} - ${_endDateController.text}');
    }
  }
}
