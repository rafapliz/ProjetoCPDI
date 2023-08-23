--local circulo = display.newCircle (90, 50, 30)
-- Transições 
-- Comandos: transition.to (variável, {parâmetros})
--transition.to (circulo, {time=3000, y = 400,})

--local circulo1 = display.newCircle (160, 50, 30)
--transition.to (circulo1, {time=3000, y=400, delta=true} )

--local circulo2 = display.newCircle (20, 50, 30)
--transition.to (circulo2, {time=3000, y=400, iterations=4, transition=easing.outElastic} )


--local retangulo = display.newRect (200, 250, 50, 70)
--transition.to (retangulo, {time=3000, rotation=90, yScale=2, alpha=0.5, iterations=-1})

local bg = display.newImageRect ("imagens/1.jpg", 800*2, 291*2  )
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local bg = display.newImageRect ("imagens/player.png", 532/2, 469/2)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

transition.to (bg, { time=1000, y=700, x=220, transition=easing.inElastic})

transition.to (bg, { time=4000, y=130, rotation=360, transition=easing.linear})

