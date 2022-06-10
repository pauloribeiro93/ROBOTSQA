*Settings*
Documentation       Suite de testes de cadastro de personagens 


Resource        base.robot


Test Setup      Start Session
Test Teardown   End Session

*Test Cases*
Deve cadastrar um novo personagem
    [Tags]      happy  

    Click   text=novo

    # Checkpoint(Para saber se formos de fato para pagina de cadastro)
    Wait For Elements State     css=p.card-header-title >> text=Cadastrar novo usuário
    ...     visible     5

    Fill Text       css=input[placeholder^="Nome"]      Mestre Yoda
    Fill Text       css=input[placeholder="Email"]      yoda@jedi.com
    

    Select Options By       css=.ordem select       text       Jedi
    Click       xpath=//input[@value="Cavaleiro Jedi"]/..//span[@class="check"]
    

    Select Birth Date        fevereiro   1970    20
   
    Fill Text       id=insta                            @yoda 

    Click       xpath=//input[@name="comunications"]/../span[@class="check"]

    Click        css=button >> text=Cadastrar

    Wait For Elements State     css=.toast div >> text=Usuário cadastrado com sucesso!
    ...                         visible     5



Devo validar a mensagem de erro
    [Tags]      inv_email

    Click   text=novo

    # Checkpoint(Para saber se formos de fato para pagina de cadastro)
    Wait For Elements State     css=p.card-header-title >> text=Cadastrar novo usuário
    ...     visible     5

    Fill Text       css=input[placeholder^="Nome"]      Darth Vader
    Fill Text       css=input[placeholder="Email"]      vader&hotmail.com
    

    Select Options By       css=.ordem select       text       Sith

    Select Birth Date        fevereiro   1970    20
   
    Fill Text       id=insta                            @vader 

    Click       xpath=//input[@name="comunications"]/../span[@class="check"]

    Click        css=button >> text=Cadastrar

    Wait For Elements State     css=.toast div >> text=Oops! O email é incorreto.
    ...                         visible     5




*Keywords*
Select Birth Date
    [Arguments]     ${month}        ${year}     ${day}

    Click       css=input[placeholder="Data de nascimento"]

    Select Options By       xpath=(//header[@class="datepicker-header"]//select)[1]
    ...                     text        ${month}

    Select Options By       xpath=(//header[@class="datepicker-header"]//select)[2]
    ...                     value        ${year}

    Click       xpath=//a[contains(@class, "datepicker-cell")]//span[text()="${day}"]

    