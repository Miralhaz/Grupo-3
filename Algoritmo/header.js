let navBar = document.querySelector('#header');
let tituloOculto = document.querySelector('#tituloOculto');

document.addEventListener("scroll", () => {
    let scrollTop = window.scrollY;
    
    if (scrollTop > 0) {
        navBar.classList.add('rolar');
        tituloOculto.classList.add('h1Visivel');
    } else {
        navBar.classList.remove('rolar');
        tituloOculto.classList.remove('h1Visivel');
    }
});
function scrollToHome() {
    const homeSection = document.getElementById("home");
    if (homeSection) {
        homeSection.scrollIntoView({ behavior: "smooth" });
    }
}
function scrolContato() {
    const homeSection = document.getElementById("contato");
    if (homeSection) {
        homeSection.scrollIntoView({ behavior: "smooth" });
    }
}
function Calcular(){
    var kilos = Number(Volume_tonelada.value)*1000
    var preco_carne = Number(Preco_carne.value)
    var taxa_perdas = ( Number(taxa_perda.value) /12)/100
    var dinheiro_perdido_ = ((kilos*taxa_perdas)*preco_carne)
    var toneladas_perdidas = (((kilos/1000)*taxa_perdas)*12).toFixed(2)
    Resultado_Economia_mes.innerHTML = `R$: ${(dinheiro_perdido_).toFixed(2)}`
    Resultado_Economia_ano.innerHTML = `R$: ${(dinheiro_perdido_*12).toFixed(2)}`
    Resultado_perda.innerHTML = `${toneladas_perdidas} ton/ano`
    produto_perdido.innerHTML = `${toneladas_perdidas} ton/ano`
    dinheiro_perdido.innerHTML = `${(dinheiro_perdido_*12).toFixed(2)} ano`
    multas.innerHTML = `R$: ${(((viagens_mes.value*0.15)*12)*5000).toFixed(2)}`
    tempo.innerHTML = `${(toneladas_perdidas * 24).toFixed(2)} mês`
    total.innerHTML = `${((dinheiro_perdido_*12)+ ((viagens_mes.value*0.15)*12)*5000).toFixed(2)}`
    CO2.innerHTML = `${(toneladas_perdidas * 4.5).toFixed(2)} ton de CO²`
    agua.innerHTML = `${((kilos/1000) * 15.5).toFixed(2)} ton`
}