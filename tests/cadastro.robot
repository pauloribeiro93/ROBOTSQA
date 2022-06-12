*Settings*
Documentation       Suite de testes de cadastro de personagens 


Resource        ${EXECDIR}/resources/base.robot


Test Setup      Start Session
Test Teardown   End Session

*Test Cases*
Deve cadastrar um novo personagem
    [Tags]      happy  

   Go To User Form  
   Fill User Form       Mestre Yoda     yoda@jedi.com       Jedi    fevereiro-1970-20       @yoda   
   Select Jedi      Cavaleiro Jedi 
   Check Accept comunications 
   Submit User Form
   Toaster Message Should Be        Usuário cadastrado com sucesso! 



Devo validar a mensagem de erro
    [Tags]      inv_email

   Go To User Form  
   Fill User Form       Darth Vader     vader&hotmail.com       Sith    fevereiro-1980-18       @vader    
   Check Accept comunications 
   Submit User Form
   Toaster Message Should Be        Oops! O email é incorreto.  

