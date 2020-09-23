class Cadastro < SitePrism::Page
  set_url "https://www.movida.com.br"

  # --------------------elements---------------------------#
  element :usermenu,      'div[class="name-user-menu"]'
  element :linkout,       'a[class="user-menu-link-out"]'
  element :controlcpf,    'input[class="form-control cpf"]' 
  element :nome,          'input[id="nome"]' 
  element :feminino,      'label[for="feminino"]'
  element :datanasc,      'input[id="data_nasc"]' 
  element :telefone,      'input[id="telefone"]' 
  element :celular,       'input[id="celular"]'
  element :email, :xpath, '(//input[@id="email"])[1]'
  element :emailconf,     'input[id="email_conf"]' 
  element :cep,           'input[id="cep"]'
  element :logradouro,    'input[id="logradouro"]' 
  element :numero,        'input[id="numero"]' 
  element :complemento,   'input[id="complemento"]' 
  element :bairro,        'input[id="bairro"]'
  element :pais,          'select[id="Pais"]'
  element :valor1,        'option[value="1"]'
  element :ufsel,         'select[id="uf_sel"]'
  element :sp,            'option[value="SP"]'
  element :cidadesel,     'select[id="cidade_sel"]'
  element :cid,           'option[value="3537909"]'
  element :senhacadastro, 'input[id="senha_cadastro"]' 
  element :senhaconf,     'input[id="senha_conf"]' 
  element :enviadados,    'button[id="btnEnviaDados"]'
  element :alert,         'div[class="alert alert-warning"]'
  # --------------------------------------------------------#
  
  def initialize
    Faker::Config.locale = 'pt-BR'
    @cpf = Faker::CPF.numeric
    @nome = Faker::Games::Zelda.location
    @telnumero = Faker::PhoneNumber.phone_number
    @datanasc = Faker::Date.birthday(min_age: 35, max_age: 50).strftime("%d/%m/%Y")
    @telefone = Faker::PhoneNumber.phone_number
    @celular = Faker::PhoneNumber.cell_phone
    @email = Faker::Internet.free_email
    @confemail = @email
    @cep = Faker::Address.zip_code
    @logradouro = Faker::Address.street_name
    @numlgrd = Faker::Address.building_number
    @complemento = Faker::Address.secondary_address
    @bairro = Faker::Address.community
    @senha = Faker::Number.number(digits: 6)
  end

  def PreencheDados
    usermenu.click
    linkout.click
    controlcpf.set @cpf
    nome.set @nome
    feminino.set true
    datanasc.set @datanasc
    telefone.set @telefone
    celular.set @celular
    email.set @email
    emailconf.set @confemail 
    cep.set @cep
    logradouro.set @logradouro
    numero.set @numlgrd 
    complemento.set @complemento
    bairro.set @bairro
    pais.click          
    valor1.set true        
    ufsel.click         
    sp.set true           
    cidadesel.click    
    cid.set true       
  end

  def Senha
    senhacadastro.set @senha
    senhaconf.set(@senha)
  end

  def Finalizacao
    enviadados.click
    wait_until_alert_visible
    puts alert.text
  end

end




