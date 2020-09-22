Dado("que eu esteja na pagina de cadastro do site") do
  Cadastro.new.load
end

Quando("realizo a criação da conta") do
    cpf = Faker::CPF.numeric
    nome = Faker::Games::Zelda.location
    telnumero = Faker::PhoneNumber.phone_number
    datanasc = Faker::Date.birthday(min_age: 35, max_age: 50).strftime("%d/%m/%Y")
    telefone = Faker::PhoneNumber.phone_number
    celular = Faker::PhoneNumber.cell_phone
    email = Faker::Internet.free_email
    confemail = email
    cep = Faker::Address.zip_code
    logradouro = Faker::Address.street_name
    numlgrd = Faker::Address.building_number
    complemento = Faker::Address.secondary_address
    bairro = Faker::Address.community
    senha = Faker::Number.number(digits: 6)

  Cadastro.new.PreencheDados
  Cadastro.new.controlcpf.set cpf
  Cadastro.new.nome.set nome
  Cadastro.new.feminino.set true
  Cadastro.new.datanasc.set datanasc
  Cadastro.new.telefone.set telefone
  Cadastro.new.celular.set celular
  Cadastro.new.email.set email
  Cadastro.new.emailconf.set confemail
  Cadastro.new.cep.set cep
  Cadastro.new.logradouro.set logradouro
  Cadastro.new.numero.set numlgrd
  Cadastro.new.complemento.set complemento
  Cadastro.new.bairro.set bairro
  Cadastro.new.pais.click
  Cadastro.new.valor1.set true
  Cadastro.new.ufsel.click
  Cadastro.new.sp.set true
  Cadastro.new.cidadesel.click
  Cadastro.new.cid.set true
  Cadastro.new.Senha.set senha
  Cadastro.new.SenhaConfirm.set senha
end

Então("devo logar no site com os dados criados") do
  Cadastro.new.Finalizacao
end