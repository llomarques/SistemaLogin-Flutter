import 'package:flutter/material.dart';
import '../dados_mock.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarsenhaController = TextEditingController();

  bool esconderSenha = false;
  bool esconderConfirmacao = false;

  void cadastrar(){
    String nome = nomeController.text.trim();
    String email = emailController.text.trim();
    String senha = senhaController.text.trim();

    if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
      mostrarMensagem('Por favor, preencha todos os campos.');
      return;
    }

    if (!email.contains('@')) {
      mostrarMensagem('Por favor, insira um e-mail válido.');
      return;
    }

    if(senha.length < 4){
      mostrarMensagem('A senha deve ter pelo menos 4 caracteres.');
      return;
    }

    if (senha != confirmarsenhaController.text.trim()) {
      mostrarMensagem('As senhas não coincidem.');
      return;
    }

    bool emailExistente = false;
    
    for (var usuario in usuarios) {
      if (usuario['email'] == email) {
        emailExistente = true;
        break;
      }
    }

    if (emailExistente) {
      mostrarMensagem('Este e-mail já está em uso.');
      return;
    }

    usuarios.add({
      'nome': nome,
      'email': email,
      'senha': senha,
    });

    mostrarMensagem('Usuário cadastrado com sucesso!');
    Navigator.pop(context);
  }

  void mostrarMensagem(String mensagem ){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        
      ),
    );
  }

@override

  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    confirmarsenhaController.dispose();
    nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Criar usuário'
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            const Icon( Icons.person_add, 
            size: 90,
            
            ),

            const SizedBox(height: 20),
            const Text(
              'Crie sua conta',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                hintText: 'Digite seu nome',
                prefixIcon: Icon(Icons.person), //prefixo aparece quando clica no campo 
                border: OutlineInputBorder(),
                
              ),
            ),

            const SizedBox(height: 15),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                hintText: 'Digite seu e-mail',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),
            TextField(
              controller: senhaController,
              obscureText: esconderSenha,
              decoration: InputDecoration(
                labelText: 'Senha',
                hintText: 'Digite sua senha',
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      esconderSenha = !esconderSenha;
                    });
                  },
                  icon: Icon(
                    esconderSenha ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                border: const OutlineInputBorder(),
              ),
            
            ),

            const SizedBox(height: 15),
            TextField(
              controller: confirmarsenhaController,
              obscureText: esconderConfirmacao,
              decoration: InputDecoration(
                labelText: 'Confirmar senha',
                hintText: 'Digite sua senha novamente',
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      esconderConfirmacao = !esconderConfirmacao;
                    });
                  },
                  icon: Icon(
                    esconderConfirmacao ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                border: const OutlineInputBorder(),
              ),
            ),


            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () { cadastrar(); },
              icon: const Icon(
                Icons.person_add,
                size: 18,
              ),
              label: const Text(
                'Cadastrar',
                style: TextStyle(fontSize: 14),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                minimumSize: Size.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            OutlinedButton(
              onPressed:() {
              Navigator.pop(context);
              },
              child:const Text(
                'Voltar para login',
              ),
            )


            // Lógica para criar o usuário
          ],
        ),
      ),
    );
  }
}

  