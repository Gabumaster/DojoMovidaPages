Dado("que eu esteja na pagina de cadastro do site") do
  @Cadastrar = Cadastro.new
  @Cadastrar.load

end

Quando("realizo a criação da conta") do
  @Cadastrar.PreencheDados
  @Cadastrar.Senha
end

Então("devo logar no site com os dados criados") do
  @Cadastrar.Finalizacao
end