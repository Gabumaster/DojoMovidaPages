Dado("que eu esteja na pagina de cadastro do site") do
  Cadastro.new.load
end

Quando("realizo a criação da conta") do
  Cadastro.new.PreencheDados
  Cadastro.new.Senha
end

Então("devo logar no site com os dados criados") do
  Cadastro.new.Finalizacao
end