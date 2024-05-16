import 'package:flutter/material.dart';
import 'package:whatsapp/uteis/paleta_cores.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerNome =
      TextEditingController(text: "Jamilton Damasceno");
  TextEditingController controllerEmail =
      TextEditingController(text: "jamilton@gamil.com");
  TextEditingController controllerSenha =
      TextEditingController(text: "1234567");

  bool cadastroUsuario = false;

  @override
  Widget build(BuildContext context) {
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: PaletaCores.corFundo,
        width: larguraTela,
        height: alturaTela,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                color: PaletaCores.corPrimaria,
                width: larguraTela,
                height: alturaTela * 0.5,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  elevation: 4,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    width: 500,
                    child: Column(children: [
                      Visibility(
                        visible: cadastroUsuario,
                        child: ClipOval(
                          child: Image.asset(
                            "imagens/perfil.png",
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: cadastroUsuario ? 8 : 0),
                      Visibility(
                        visible: cadastroUsuario,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text("Selecionar foto"),
                        ),
                      ),
                      SizedBox(height: cadastroUsuario ? 8 : 0),
                      Visibility(
                        visible: cadastroUsuario,
                        child: TextField(
                          controller: controllerNome,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Nome",
                            labelText: "Nome",
                            suffixIcon: Icon(Icons.person_outline),
                          ),
                        ),
                      ),
                      TextField(
                        controller: controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          labelText: "Email",
                          suffixIcon: Icon(
                            Icons.mail_outline,
                          ),
                        ),
                      ),
                      TextField(
                        controller: controllerSenha,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Senha",
                          labelText: "Senha",
                          suffixIcon: Icon(Icons.lock_outlined),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PaletaCores.corPrimaria,
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              cadastroUsuario ? "Cadastro" : "Login",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Text("Login"),
                          Switch(
                              value: cadastroUsuario,
                              activeColor: PaletaCores.corPrimaria,
                              onChanged: (bool value) {
                                setState(() {
                                  cadastroUsuario = value;
                                });
                              }),
                          const Text("Cadastro"),
                        ],
                      )
                    ]),
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
