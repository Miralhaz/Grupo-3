//MÉTODO DE LOGIN

function logarUsuario() {
    var emailBD = 'guilherme.soliveira@sptech.school';
    var senhaBD = 'Sptech#2024';

    var emailLogin = ipt_email_login.value;
    var senhaLogin = ipt_senha_login.value;
    var confirmaSenha = ipt_confirma_login.value;

    // Validação de campos vazios
    if (emailLogin == '') {
        div_preencha_email.innerHTML = `Preencha com seu Email!!`;
    } else {
        div_preencha_email.innerHTML = '';
    }
    if (senhaLogin == '') {
        div_preencha_senha.innerHTML = `Preencha com sua Senha!!`;
    } else {
        div_preencha_senha.innerHTML = '';
    }
    if (confirmaSenha == '') {
        div_preencha_confirma_senha.innerHTML = `Preencha sua Senha Novamente!!`;
    } else {
        div_preencha_confirma_senha.innerHTML = '';
    }

    // Verificando se o e-mail termina com @sptech.school
    if (emailLogin.endsWith('@sptech.school')) {
        div_preencha_email.innerHTML = '';
    } else {
        div_preencha_email.innerHTML = 'O Email Precisa Conter @sptech.school';
    }

    emailValido = true;

    // Valida se confirmação da senha está correta
    if (senhaLogin != confirmaSenha) {
        div_erro_logar.innerHTML = 'As senhas não coincidem!';
    }

    // Loop até login ser bem-sucedido

    while (true) {
        if (emailLogin == emailBD && senhaLogin == senhaBD) {
            div_erro_logar.innerHTML = '';
            div_login_feito.innerHTML = 'Login bem sucedido!!'
            setTimeout(function () {
                window.location.href = 'dashboard.html'
            }, 2000);
            break;
        } else {
            div_erro_logar.innerHTML = 'Erro ao Logar Usuário! Verifique as Informações.';
            break;
        }
    }
}

//MÉTODO CADASTRO

function cadastroUsuario() {

    var nomeCadastro = ipt_nome_cadastro.value;
    var confirmarSenhaCadastro = ipt_confirm_passwd_cadastro.value;
    var senhaCadastro = ipt_passwd_cadastro.value;
    var emailCadastro = ipt_email_cadastro.value;

    // Validações de nome, email, senha e confirmar senha
    if (nomeCadastro == '') {
        div_preencha_nome_cadastro.innerHTML = `O campo Nome não pode estar vazio!!`;
    } else {
        div_preencha_nome_cadastro.innerHTML = ''
    }

    if (emailCadastro == '') {
        div_preencha_email_cadastro.innerHTML = `O campo Email não pode estar vazio!!`
    } else if (emailCadastro.endsWith('@sptech.school')) {
        div_preencha_email_cadastro.innerHTML = '';
    } else {
        div_preencha_email_cadastro.innerHTML = 'O Email Precisa Conter @sptech.school';
    }

    if (senhaCadastro == '') {
        div_preencha_senha_cadastro.innerHTML = `O campo Senha não pode estar vazio!!`;
    } else {
        div_preencha_senha_cadastro.innerHTML = '';
    }

    // Validação de senha se possui simbolos
    var simbolos = "!@#$%^&*()_+[]{}|;:',.<>?/`~";
    var temSimbolo = false;
    var i = 0;

    while (i < senhaCadastro.length && !temSimbolo) {
        var j = 0;
        var caractereSenha = '';
        var k = 0;

        // Obter caractere da senha
        while (k <= i) {
            caractereSenha = senhaCadastro[k];
            k++;
        }

        while (j < simbolos.length) {
            var caractereSimbolo = '';
            var l = 0;

            // Obter caractere do símbolo
            while (l <= j) {
                caractereSimbolo = simbolos[l];
                l++;
            }

            if (caractereSenha == caractereSimbolo) {
                temSimbolo = true;
                break;
            }

            j++;
        }

        i++;
    }

    if (!temSimbolo) {
        div_preencha_senha_cadastro.innerHTML = 'A senha deve conter pelo menos um símbolo (!@#$...)';
    }

    if (confirmarSenhaCadastro != senhaCadastro) {
        div_preencha_senha_confirmar_cadastro.innerHTML = `O campo Confirmar Senha deve ser a mesma senha que digitou em Senha!!`
    } else if (confirmarSenhaCadastro == '') {
        div_preencha_senha_confirmar_cadastro.innerHTML = `O campo Confirmar Senha não pode estar vazio!!`
    } else {
        div_preencha_senha_confirmar_cadastro.innerHTML = ''
    }

    // Validação se estiver tudo certo levar o usuário para a parte de login

    if (senhaCadastro == confirmarSenhaCadastro && emailCadastro.endsWith('@sptech.school') && temSimbolo) {
        div_cadastro_feito.innerHTML = `Cadastro concluído! <br> Muito obrigado!`
        div_erro_cadastro.innerHTML = ''
        setTimeout(function () {
            window.location.href = 'login.html'
        }, 2000)
    } else {
        div_erro_cadastro.innerHTML = `Cadastro não concluído`
    }
}