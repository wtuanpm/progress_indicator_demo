import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_demo/bloc/app_bloc.dart';
import 'package:intro_demo/bloc/app_event.dart';
import 'package:intro_demo/bloc/app_state.dart';
import 'package:intro_demo/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  late final AppBloc _appBloc;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(_progressIndicatorListener);
    controller.animateTo(1);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _progressIndicatorListener() {
    if (controller.value >= 1 &&
        _appBloc.state.status == GetConfigurationStatus.success) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      // ngay sau khi app bloc instance được khởi tạo, call api get configuration
      create: (context) {
        _appBloc = AppBloc();
        return _appBloc..add(GetConfigurationEvent());
      },
      child: BlocListener<AppBloc, AppState>(
        listener: ((context, state) {
          switch (state.status) {
            case GetConfigurationStatus.empty:
              // TODO: Handle this case.
              break;
            case GetConfigurationStatus.progressing:
              // TODO: Handle this case.
              break;
            case GetConfigurationStatus.success:
              if (controller.value >= 1) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              }

              break;
            case GetConfigurationStatus.error:
              // TODO: Handle this case.
              break;
          }
        }),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  'Linear progress indicator with a fixed color',
                  style: TextStyle(fontSize: 20),
                ),
                LinearProgressIndicator(
                  value: controller.value,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
