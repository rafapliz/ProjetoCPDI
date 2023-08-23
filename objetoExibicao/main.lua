    local bg = display.newImageRect ("imagens/bg.jpg", 1280 * 1.25, 720 * 1,25)
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY

    local pikachu = display.newImageRect ("imagens/pikachu.png", 1191/5, 1254/5)

    pikachu.x = display.contentCenterX
    pikachu.y = display.contentCenterY + 100

    local charmander = display.newImageRect ("imagens/charmander.png", 507/2, 492/2)
    charmander.x = 250
    charmander.y = 250
   
    local retangulo = display.newRect(350, 200, 150, 90)
    retangulo.x = 800
    retangulo.y = 400 

    local circulo = display.newCircle (0, 60, 60)
    circulo.x = 120
    circulo.y = 110
    
  -- Adicionar o mystery EM CIMA do retângulo (não pode mudar o retângulo de lugar) e o charmander na diagonal do círculo (não pode mudar o círculo de lugar) diagonal para baixo em qualquer um dos lados.
  local mystery = display.newImageRect ("imagens/mystery.png", 493*0.40, 506*0.40)
    mystery.x = 775
    mystery.y = 400
  
--Tirar print da engine (simulador, celular) E do código do VS e adicionar em um doc na pasta do drive com seu nome. 
--Título do arquivo: Desafio 11/05 
--Rafael Pereira de Liz
    

    