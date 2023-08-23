local physics = require ("physics")
physics.start ()
physics.setGravity (0, 0)
physics.setDrawMode ("hybrid")
--physics.setDrawMode ("hybrid")

local bodies = {} -- String/tabela para armazenamento
local bodiesGroup = display.newGroup ()
local joints = {} -- String/ tabela para armazenamento das juntas.

display.setStatusBar (display.HiddenStatusBar)

local grupoBg = display.newGroup() 
local grupoMain = display.newGroup() 
local grupoUI = display.newGroup() 

local defesas = 0
local gols = 0

local bg = display.newImageRect (grupoBg, "imagens/campo.png", 1172*1.1, 764*1.1 )
bg.x = display.contentCenterX
bg.y = display.contentCenterY  

local defesasText = display.newText (grupoUI, "Defesas: " .. defesas, 150, 70, native.systemFont, 50)
defesasText:setFillColor (255, 255, 255)

local golsText = display.newText (grupoUI, "Gols: " .. gols, 880, 70, native.systemFont, 50)
golsText:setFillColor (255, 255, 255)

local jogador = display.newImageRect (grupoMain, "imagens/jogador.png", 1000/4, 995/4)
jogador.x = 900
jogador.y = display.contentCenterY
jogador.myName = "jogador"
physics.addBody (jogador, "kinematic") 
local direcaoJogador = "cima"

local trave = display.newImageRect (grupoMain, "imagens/trave.png", 223*0.8, 500*0.8	)
trave.x = 30
trave.y = display.contentCenterY
trave.myName = "trave" 
physics.addBody (trave, "static", {isSensor=true}) 
trave.rotation = 180


local goleiro = display.newImageRect (grupoMain, "imagens/goleiro.png", 4500/13, 3375/13)
goleiro.x = 100
goleiro.y = 300
goleiro.myName = "goleiro" 
physics.addBody (goleiro, "kinematic", {radius=100}) 
local direcaoInimigo = "cima"
goleiro.rotation = 90


local botaoChute = display.newImageRect (grupoMain, "imagens/botaoChute.png", 1024/8, 768/8)
botaoChute.x = 720
botaoChute.y = 680

local function chutar ()
	local jogadorChute = display.newImageRect (grupoMain, "imagens/bola.png", 600/10, 600/10)
	jogadorChute.x = jogador.x +20
	jogadorChute.y = jogador.y + 90
	physics.addBody (jogadorChute, "dynamic", {isSensor=true, radius=20}) 
	transition.to (jogadorChute, {x=-100, time=1900, onComplete = function () display.remove (jogadorChute) end })
	jogadorChute.myName = "bola"

--trave:applyLinearImpulse (0.3, 0, trave.x, trave.y-5)

end

botaoChute:addEventListener ("tap", chutar)





local function movimentarJogador ()

	if not (jogador.x == nil) then

		if (direcaoJogador == "cima") then
			jogador.y = jogador.y - 7
			
			if (jogador.y <= 100) then
			
				direcaoJogador = "baixo"
			end
		
		elseif (direcaoJogador == "baixo") then
			jogador.y = jogador.y + 7

			if (jogador.y >= 580) then
				direcaoJogador = "cima"
			end
		end
	end
end

Runtime:addEventListener ("enterFrame", movimentarJogador)	

local function movimentarInimigo ()

	if not (goleiro.x == nil) then

		if (direcaoInimigo == "cima") then
			goleiro.y = goleiro.y - 1
			goleiro.xScale = -1
			
			if (goleiro.y <= 240) then
				direcaoInimigo = "baixo"
			end
		
		elseif (direcaoInimigo == "baixo") then
			goleiro.y = goleiro.y + 1
			goleiro.xScale = 1
			if (goleiro.y >= 530) then
				direcaoInimigo = "cima"
			end
		end
	end

end
		Runtime:addEventListener ("enterFrame", movimentarInimigo)	

local function onCollision (event)

	if (event.phase == "began") then

		local obj1 = event.object1
		local obj2 = event.object2

		if ((obj1.myName == "goleiro" and obj2.myName == "bola"))		then

			if (obj1.myName == "bola") then
				display.remove (obj1)
			else
				display.remove(obj2)
		end

		defesas = defesas + 1
		defesasText.text = "Defesas: " .. defesas
	

			if (defesas >= 5) then
			Runtime:removeEventListener ("collision", onCollision)
			Runtime:removeEventListener ("enterFrame", movimentarInimigo)
			Runtime:removeEventListener ("enterFrame", movimentarJogador)
			botaoChute:removeEventListener ("tap", chutar)

			local gameOver = display.newImageRect (grupoUI, "imagens/perdeu.png", 500, 500)
			gameOver.x = display.contentCenterX
			gameOver.y = display.contentCenterY
		end
	
	elseif ((obj1.myName == "trave" and obj2.myName == "bola") or (obj1.myName == "bola" and obj2.myName == "trave")) then
			if (obj1.myName == "trave") then
			display.remove (obj2)
						
		end
			
		gols = gols + 1
		golsText.text = "Gols: " .. gols

		if (gols >= 5) then
			Runtime:removeEventListener ("collision", onCollision)
			Runtime:removeEventListener ("enterFrame", movimentarInimigo)
			Runtime:removeEventListener ("enterFrame", movimentarJogador)
			botaoChute:removeEventListener ("tap", chutar)

			local voceGanhou = display.newImageRect (grupoUI, "imagens/ganhou.png", 625, 953)
			voceGanhou.x = display.contentCenterX
			voceGanhou.y = display.contentCenterY

			end
		end
	end
end

Runtime:addEventListener ("collision", onCollision)

