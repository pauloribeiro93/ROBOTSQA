*Settings*
Documentation       Aqui não é suite, mas o arquivo principal do projeto

Library     Browser
Library     String

Resource    actions.robot    


*Keywords*
Start Session
    New Browser     chromium       headless=false   slowMo=00:00:00
    New Page        https://yodapp-testing.vercel.app

End Session
    Take Screenshot 

        