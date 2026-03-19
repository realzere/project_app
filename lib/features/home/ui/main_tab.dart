import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/l10n/app_localizations.dart';

import '../../../core/constants/app_constants.dart';
import '../../../features/app/bloc/app_bloc.dart';
import '../../../widgets/user_avatar.dart';

class MainTab extends StatelessWidget {
  const MainTab({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final appState = context.watch<AppBloc>().state;
    final user = appState.user;

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(loc.tabMain)),

      body: ListView(
        padding: const EdgeInsets.all(AppConstants.largePadding),
        children: [
          Center(
            child: Column(
              children: [
                UserAvatar(photoUrl: user.photoUrl),
                const SizedBox(height: 16),
                Text(
                  loc.greeting(
                    user.displayName.isNotEmpty
                        ? user.displayName
                        : 'User',
                  ),
                  style: textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          _buildBanner(),

          const SizedBox(height: 20),

          _buildProjectCard(),
          _buildProjectCard(),
          _buildProjectCard(),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFDCD6FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              "https://picsum.photos/400/200",
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Заголовок",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text("Текст"),
        ],
      ),
    );
  }

  Widget _buildProjectCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepPurple, width: 2),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Название",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text("Навыки"),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
            ),
            child: const Text("Записаться"),
          ),
        ],
      ),
    );
  }
}