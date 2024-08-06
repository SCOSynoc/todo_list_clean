
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list_cgi/presentation/bloc/task_bloc.dart';
import 'package:to_do_list_cgi/presentation/pages/main_page.dart';


void main() {
  testWidgets('Main Page contains a task input field', (WidgetTester tester) async {
    await tester.pumpWidget(
        MultiBlocProvider(

            providers: [
              BlocProvider(create: (context) => TaskBloc())
            ],
            child: const MaterialApp(home: MainPage()))
    );

    expect(find.byType(TextField), findsOneWidget);
  });
}
