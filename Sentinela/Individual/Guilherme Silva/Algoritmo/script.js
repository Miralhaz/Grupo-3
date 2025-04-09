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
            window.location.href = 'dashboard.html';
            break;
        } else {
            div_erro_logar.innerHTML = 'Erro ao Logar Usuário! Verifique as Informações.';
            break;
        }
    }
}

//MÉTODO CADASTRO
