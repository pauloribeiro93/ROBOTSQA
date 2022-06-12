*Settings*
Documentation       Ações customizadas do Yodapp


*Keywords*
Go To User Form
    Click   text=novo

    # Checkpoint(Para saber se formos de fato para pagina de cadastro)
    Wait For Elements State     css=p.card-header-title >> text=Cadastrar novo usuário
    ...     visible     5

Fill User Form
    [Arguments]     ${name}     ${email}    ${ordem}    ${bdate}    ${instagram}
    Fill Text       css=input[name="nome"]     ${name}
    Fill Text       css=input[name="email"]      ${email}
    
    Select Options By       css=.ordem select       text       ${ordem}

    Select Birth Date           ${bdate}
   
    Fill Text       id=insta                            ${instagram}    


Select Jedi
    [Arguments]         ${tpjedi}

    Click       xpath=//input[@value="${tpjedi}"]/..//span[@class="check"]


Check Accept comunications
    Click       xpath=//input[@name="comunications"]/../span[@class="check"]


Select Birth Date
    [Arguments]     ${text_date}

    @{date}     Split String        ${text_date}        -             

    Click       css=input[name="Data de nascimento"]

    Select Options By       xpath=(//header[@class="datepicker-header"]//select)[1]     
    ...                     text        ${date}[0]

    Select Options By       xpath=(//header[@class="datepicker-header"]//select)[2]
    ...                     value        ${date}[1]

    Click       xpath=//a[contains(@class, "datepicker-cell")]//span[text()="${date}[2]"]


Submit User Form
    Click        css=button >> text=Cadastrar

Toaster Message Should Be
    [Arguments]     ${expect_menssage}
     
    Wait For Elements State     css=.toast div >> text=${expect_menssage}
    ...                         visible     5 
   
