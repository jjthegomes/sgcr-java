function pagamento(formaPagamento) {
    if (formaPagamento === "cartaoCredito") {
        $('.pagamentoCartaoCredito').prop("disabled", false);
        $('.pagamentoBoleto').prop("disabled", true);
    } else if (formaPagamento === "boleto") {
        $('.pagamentoCartaoCredito').prop("disabled", true);
        $('.pagamentoBoleto').prop("disabled", false);
    }
}