import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/routes/name.dart';
import 'package:u_learning/common/values/constant.dart';
import 'package:u_learning/global.dart';
import 'package:u_learning/pages/application/bloc/app_blocs.dart';
import 'package:u_learning/pages/application/bloc/app_events.dart';
import 'package:u_learning/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:u_learning/pages/profile/settings/bloc/settings_state.dart';
import 'package:u_learning/pages/profile/settings/widgets/settings_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBlocs>().add(
          const TrigerAppEvent(
            0,
          ),
        );
    Global.storageService.remove(
      AppConstants.STORAGE_USER_TOKEN_KEY,
    );
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.SIGNIN,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildSettingsAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingsState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  settingsButton(
                    context,
                    () {
                      removeUserData();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
