import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  late final AppLifecycleListener _listener;
  final List<String> _states = <String>[];
  late AppLifecycleState? _state;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance?.addObserver(this);
    _state = SchedulerBinding.instance.lifecycleState;
    _listener = AppLifecycleListener(
      onShow: () => _handleTransition('show'),
      onResume: () => _handleTransition('resume'),
      onHide: () => _handleTransition('hide'),
      onInactive: () => _handleTransition('inactive'),
      onPause: () => _handleTransition('pause'),
      onDetach: () => _handleTransition('detach'),
      onRestart: () => _handleTransition('restart'),
      // This fires for each state change. Callbacks above fire only for
      // specific state transitions.
      onStateChange: _handleStateChange,
    );
    if (_state != null) {
      _states.add(_state!.name);
    }
    print('Execute initState');
  }

  @override
  void dispose() {
    // WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
    print('Execute dispose');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        print('App Lifecycle State: resumed');
        break;
      case AppLifecycleState.inactive:
        print('App Lifecycle State: inactive');
        break;
      case AppLifecycleState.hidden:
        print('App Lifecycle State: hidden');
        break;
      case AppLifecycleState.paused:
        print('App Lifecycle State: paused');
        break;
      case AppLifecycleState.detached:
        print('App Lifecycle State: detached | remove app');
        break;
    }
  }

  void _handleTransition(String name) {
    setState(() {
      _states.add(name);
    });
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  void _handleStateChange(AppLifecycleState state) {
    setState(() {
      _state = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: /*const Center(
        child: Text(
          'This is the home screen',
        ),
      ),*/
      SizedBox(
        width: 300,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: <Widget>[
              Text('Current State: ${_state ?? 'Not initialized yet'}'),
              const SizedBox(height: 30),
              Text('State History:\n  ${_states.join('\n  ')}'),
            ],
          ),
        ),
      ),
    );
  }
}