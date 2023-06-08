import 'package:bardly_mobile_app/bloc/bard/bard_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviders {
  static BlocProviders? _instance;
  static BlocProviders get instance => _instance ??= BlocProviders._initialize();
  List<BlocProvider> get providers => _providers;
  final List<BlocProvider> _providers = [
    BlocProvider(
      create: (_) => BardBloc(),
    ),
  ];
  BlocProviders._initialize();
}
