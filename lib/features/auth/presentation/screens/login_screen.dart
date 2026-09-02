
import 'package:payku_mobile/features/auth/presentation/providers/providers.dart';
import 'package:payku_mobile/features/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
    0xff123456; //Theme.of(context).scaffoldBackgroundColor;
    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height - 280;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: SizedBox.expand(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  'https://plus.unsplash.com/premium_photo-1771774994010-576337c0d143?q=80&w=678&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: Color(0xff123456), // Color mientras carga
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
              ), // imagen de fondo
              SafeArea(
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Container(
                        alignment: Alignment.center,
                        child: Image.network(
                          width: 200,
                          height: 100,
                          'https://payku.com/images/pk23logo.png',
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) {
                            print(
                              'Error loading image: $error',
                            ); // Ver el error
                            return Icon(Icons.error, color: Colors.red);
                          },
                        ),
                      ),
                      SizedBox(height: 140),
                      Container(
                        height: size.height - 280, // 40 + 100 140
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.8),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Container(
                              height: height,
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 10,
                              ),
                              width: double.infinity,
                              child: _AccessForm()
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccessForm extends ConsumerWidget {
  const _AccessForm({super.key});

  void showSnackbar(BuildContext context, String message){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginScreenProvider);

    ref.listen(authProvider, (previous, next) {
      print('Holaa probando');
      if (next.errorMessage.isEmpty) return;
      showSnackbar(context, next.errorMessage);
    });

    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            label: 'Ingrese su Email',
            onChaged: ref.read(loginScreenProvider.notifier).onUsernameChange,
            errorMessage: loginForm.isFormPosted ? loginForm.username.errorMessage :  null,
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            label: 'Ingrese su Clave',
            onChaged: ref.read(loginScreenProvider.notifier).onPasswordChanged,
            errorMessage: loginForm.isFormPosted ? loginForm.password.errorMessage : null,
            obscureText: true,
          ),
          SizedBox(height: 40),
          FilledButton.tonalIcon(
            onPressed: loginForm.isPosting
                ? null
                : () => ref.read(loginScreenProvider.notifier).onFormSubmit(),
            icon: loginForm.isPosting
                ? SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38),
              ),
            )
                : const Icon(Icons.arrow_circle_right),
            label: Text(loginForm.isPosting ? 'Ingresando...' : 'Entrar'),
          ),
        ],
      ),
    );
  }
}