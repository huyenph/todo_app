import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/blocs/task/task_bloc.dart';
import 'package:todo_app/src/common/utils.dart';
import 'package:todo_app/src/core/state/base_state.dart';
import 'package:todo_app/src/di/injector_setup.dart';
import 'package:todo_app/src/domain/model/todo.dart';
import 'package:todo_app/src/presentation/components/todo_button.dart';
import 'package:todo_app/src/presentation/components/todo_text_field.dart';
import 'package:uuid/uuid.dart';

class CreateTaskScreen extends StatefulWidget {
  final Todo? todo;

  const CreateTaskScreen({
    Key? key,
    this.todo,
  }) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends BaseState<CreateTaskScreen> {
  final _titleController = TextEditingController();
  final _desController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Todo? _todo;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    _todo = widget.todo;
    if (_todo != null) {
      _titleController.text = _todo!.title;
      _desController.text = _todo!.description;
      _startDate = _todo!.startDate;
      _endDate = _todo!.endDate;
      _startDateController.text = formatDate(_startDate!);
      _endDateController.text = formatDate(_endDate!);
    }
  }

  @override
  Widget buildBody() {
    return BlocProvider(
      create: (_) => TaskBloc(injector()),
      child: BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state is OnDateChangedState) {
            if (state.isStartDate) {
              _startDate = state.dateTime;
              if (_endDate != null && _startDate!.isAfter(_endDate!)) {
                _endDate = _startDate;
                _endDateController.text = formatDate(_endDate!);
              }
              _startDateController.text = formatDate(_startDate!);
            } else {
              _endDate = state.dateTime;
              _endDateController.text = formatDate(_endDate!);
            }
          }
          if (state.isCreateSuccess! || state.isUpdateSuccess!) {
            showAlertDialog(
              message: state.message!,
              actionLabel: 'Ok',
              onPressed: () => Navigator.pop(context),
            );
          }
          if (!state.isCreateSuccess! && !state.isUpdateSuccess!) {
            showAlertDialog(
              message: state.message!,
              isSuccess: false,
              actionLabel: 'Retry',
              onPressed: null,
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Title *'),
                  TodoTextField(
                    key: const Key('titleField'),
                    controller: _titleController,
                    hintText: 'Your task title',
                    labelText: 'Title *',
                  ),
                  const SizedBox(height: 20.0),
                  const Text('Description'),
                  TodoTextField(
                    key: const Key('desField'),
                    controller: _desController,
                    hintText: 'Your task description',
                    labelText: 'Description',
                    maxLines: 10,
                    isRequired: false,
                  ),
                  const SizedBox(height: 20.0),
                  const Text('Start date *'),
                  TodoTextField(
                    key: const Key('startDateField'),
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
                  const Text('End date *'),
                  TodoTextField(
                    key: const Key('endDateField'),
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
                  TodoButton(
                    key: const Key('confirmButton'),
                    onPressed: () => _onHandlePressed(context),
                    label: _todo == null ? 'Create' : 'Update',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  String get appBarTitle => _todo == null ? 'New task' : 'Update task';

  @override
  void dispose() {
    super.dispose();
  }

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
      context.read<TaskBloc>().add(OnDateChanged(pickedDate, isStartDate));
    }
  }

  void _onHandlePressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_todo == null) {
        Todo todo = Todo(
          id: const Uuid().v4(),
          title: _titleController.text,
          description: _desController.text,
          status: 0,
          startDate: _startDate!,
          endDate: _endDate!,
          modifyDate: DateTime.now(),
        );
        context.read<TaskBloc>().add(OnTaskCreated(todo));
      } else {
        Todo todo = Todo(
          id: _todo!.id,
          title: _titleController.text,
          description: _desController.text,
          status: _todo!.status,
          startDate: _startDate!,
          endDate: _endDate!,
          modifyDate: _todo!.modifyDate,
        );
        if (widget.todo != todo) {
          context.read<TaskBloc>().add(OnTaskUpdated(todo));
        } else {
          Navigator.pop(context);
        }
      }
    }
  }
}
