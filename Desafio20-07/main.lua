local scriptPlayer = require ("Player")
local perspective = require ("perspective")

----- physics ----
local physics = require ("physics")
physics.start ()
physics.setGravity (0, 9.8)
physics.setDrawMode ("hybrid")

--Cria a câmera
local camera = perspective.createView()
camera:prependLayer () -- Prepara os layers da câmera.

-- remove satus bar --
display.setStatusBar (display.HiddenStatusBar)

local bg = display.newImageRect ("imagens/background.png", 360, 570)
bg.x, bg.y = display.contentCenterX, display.contentCenterY
camera:add(bg, 3) -- Adiciona a imagem ao layer específico.


    local  chao = display.newImageRect ("imagens/chao.png", 4503*0.03, 613*0.04)
    chao.x = 100 
    chao.y = 180
    chao.id = "chao"
    camera:add (chao, 2)
    physics.addBody (chao, "static", {friction=1, box = {x=0, y=0, halfWidth=chao.width/2, halfHeight = chao.height/5}})
  

    local  chao2 = display.newImageRect ("imagens/chao.png", 4503*0.03, 613*0.04)
    chao2.x = 200 
    chao2.y = chao.y + 200
    camera:add (chao2, 2)
    chao2.id = "chao"
    physics.addBody (chao2, "static", {friction=1, box = {x=0, y=0, halfWidth=chao2.width/2, halfHeight = chao2.height/5}})


    local  chao3 = display.newImageRect ("imagens/chao.png", 4503*0.03, 613*0.04)
    chao3.x = 300
    chao3.y = chao2.y + 200
    camera:add (chao3, 2)
    chao3.id = "chao"
    physics.addBody (chao3, "static", {friction=1, box = {x=0, y=0, halfWidth=chao3.width/2, halfHeight = chao3.height/5}})


    local  chao4 = display.newImageRect ("imagens/chao.png", 4503*0.03, 613*0.04)
    chao4.x = 400
    chao4.y = chao3.y + 200
    camera:add (chao4, 2)
    chao4.id = "chao"
    physics.addBody (chao4, "static", {friction=1, box = {x=0, y=0, halfWidth=chao4.width/2, halfHeight = chao4.height/5}})

    local  chao5 = display.newImageRect ("imagens/chao.png", 4503*0.03, 613*0.04)
    chao5.x = 300
    chao5.y = chao4.y + 200
    camera:add (chao5, 2)
    chao5.id = "chao"
    physics.addBody (chao5, "static", {friction=1, box = {x=0, y=0, halfWidth=chao5.width/2, halfHeight = chao5.height/5}})

    local  chao6 = display.newImageRect ("imagens/chao.png", 4503*0.03, 613*0.04)
    chao6.x = 200
    chao6.y = chao5.y + 200
    camera:add (chao6, 2)
    chao6.id = "chao"
    physics.addBody (chao6, "static", {friction=1, box = {x=0, y=0, halfWidth=chao6.width/2, halfHeight = chao6.height/5}})

    local  chao7 = display.newImageRect ("imagens/chao.png", 4503*0.03, 613*0.04)
    chao7.x = 100
    chao7.y = chao6.y + 200
    camera:add (chao3, 2)
    chao7.id = "chao"
    physics.addBody (chao7, "static", {friction=1, box = {x=0, y=0, halfWidth=chao7.width/2, halfHeight = chao7.height/5}})

    local  chao8 = display.newImageRect ("imagens/chao.png", 4503*0.03, 613*0.04)
    chao8.x = 180
    chao8.y = chao7.y + 200
    camera:add (chao3, 2)
    chao8.id = "chao"
    physics.addBody (chao8, "static", {friction=1, box = {x=0, y=0, halfWidth=chao8.width/2, halfHeight = chao8.height/5}})

    local  chao9 = display.newImageRect ("imagens/chao.png", 4503*0.03, 613*0.04)
    chao9.x = 250
    chao9.y = chao8.y + 200
    camera:add (chao9, 2)
    chao9.id = "chao"
    physics.addBody (chao9, "static", {friction=1, box = {x=0, y=0, halfWidth=chao9.width/2, halfHeight = chao9.height/5}})

local player = scriptPlayer.novo (240,0)
camera:add (player, 1)

camera:setParallax (1, 0.9, 0)

camera.damping = 10 -- Controla a fluidez da camera ao seguir o player. 

 camera:setFocus (player) -- Define que o player é o foco da câmera
 camera:track() -- Inicia a perseguição da câmera.
