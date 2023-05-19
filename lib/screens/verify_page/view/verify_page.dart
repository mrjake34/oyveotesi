import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oyveotesi/screens/verify_page/cubit/verify_page_cubit.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyPageCubit(),
      child: BlocConsumer<VerifyPageCubit, VerifyPageState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return BuildScaffold();
        },
      ),
    );
  }
}

class BuildScaffold extends StatelessWidget {
  const BuildScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
