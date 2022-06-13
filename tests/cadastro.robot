*Settings*
Documentation       Suite de testes de cadastro de personagens 


Resource        ${EXECDIR}/resources/base.robot


Test Setup      Start Session
Test Teardown   End Session

*Test Cases*
Deve cadastrar um novo personagem
    [Tags]      happy

   &{user}      Create Dictionary
   ...          name=Mestre Yoda
   ...          email=yoda@jedi.com
   ...          ordem=Jedi
   ...          tpjedi=Cavaleiro Jedi 
   ...          bdate=fevereiro-1970-20
   ...          instagram=@yoda

   Go To User Form  
   Fill User Form       ${user}                         
   Select Jedi      ${user}[tpjedi] 
   Check Accept comunications 
   Submit User Form
   Toaster Message Should Be        Usuário cadastrado com sucesso! 



Devo validar a mensagem de erro
    [Tags]      inv_email

    &{user}      Create Dictionary
    ...          name=Darth Vader
    ...          email=vader&hotmail.com
    ...          ordem=Sith
    ...          bdate=fevereiro-1970-20
    ...          instagram=@vader

    Go To User Form  
    Fill User Form      ${user}                                 
    Check Accept comunications 
    Submit User Form
    Toaster Message Should Be        Oops! O email é incorreto.  

