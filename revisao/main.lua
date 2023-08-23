-- Chamar a biblioteca de física
local physics = require ("physics")
-- Iniciar o motor de física
physics.start ()
-- Definir a gravidade 
physics.setGravity (0, 0)
-- Definir o modo de renderização
physics.setDrawMode ("normal") -- normal, hybrid, debug

-- Remover a barra de notificações
display.setStatusBar (display.HiddenStatusBar)

-- Criar os grupos de exibição

local grupoBg = display.newGroup() -- Objetos decorativos, cenário (não tem interação com o player)
local grupoMain = display.newGroup() -- Bloco principal (tudo que recisar interagir com o player fica nesse grupo)
local grupoUI = display.newGroup() -- Interface do usuário (placares, botões....)

-- Criar variáveis de pontos e vidas para atribuição de valor.

local pontos = 0
local vidas = 5

-- Adicionar background 
-- 								(grupom, "pasta/nome do arquivo",  Posição X, posição Y)
local bg = display.newImageRect (grupoBg, "imagens/elevador.jpg", 1024/1.5, 768/1.5 )
bg.x = display.contentCenterX - 150  -- localização horizontal
bg.y = display.contentCenterY  -- localização vertical

-- Adicionar placar na tela
-- (grupo, "Escreve o que irá aparecer na tela", localizaçãoX, localizaçãoY, Fonte, tamanho da fonte)
local pontosText = display.newText (grupoUI, "Pontos: " .. pontos, 50, 30, native.systemFont, 20)
pontosText:setFillColor (0, 0, 205)

local vidasText = display.newText (grupoUI, "Vidas: " .. vidas, 280, 30, native.systemFont, 20)
vidasText:setFillColor (0,0,205)

-- Adicionar herói

local charmander = display.newImageRect (grupoMain, "imagens/charmander.png", 507/4, 492/4)
charmander.x = 300
charmander.y = 360
charmander.myName = "Charmander"
physics.addBody (charmander, "kinematic") -- Colide apenas com o dinâmico e não tem interferência da gravidade.

-- Criar botões
local botaoCima = display.newImageRect (grupoMain, "imagens/button.png", 1280/30, 1279/30)
botaoCima.x = display.contentCenterX + 50
botaoCima.y = 450
botaoCima.rotation = - 90 -- faz a rotação da imagem em graus. 

local botaoBaixo = display.newImageRect (grupoMain, "imagens/button.png", 1280/30, 1279/30)
botaoBaixo.x = display.contentCenterX - 50
botaoBaixo.y = 450
botaoBaixo.rotation = 90

-- Adicionar funções de movimentação

local function cima ()
	charmander.y = charmander.y - 10
end

local function baixo ()
	charmander.y = charmander.y + 10
end

botaoCima:addEventListener ("tap", cima)
botaoBaixo:addEventListener ("tap", baixo)



-- Adicionar botão de tiro

local botaoTiro = display.newImageRect (grupoMain, "imagens/botaotiro.png", 1280/30, 1279/30)
botaoTiro.x = display.contentCenterX
botaoTiro.y = 450

-- Função para atirar: 
local function atirar () -- Toda vez que a função for executado cria-se um novo tiro
	local feiticoPlayer = display.newImageRect (grupoMain, "imagens/magia.png", 1131*0.2 , 707*0.2) -- A localização é a mesma do player
	feiticoPlayer.x = charmander.x 
	feiticoPlayer.y = charmander.y
	physics.addBody (feiticoPlayer, "dynamic", {isSensor=true, radius=60}) -- determinamos que o projétil é um sensor, o que ativa a detecção contínua de colisão.
	transition.to (feiticoPlayer, {x=-100, time=1900, onComplete = function () display.remove (feiticoPlayer) end })
	-- Quando a transição for completa removemos o projétil do display 
	feiticoPlayer.myName = "Stupefy"
end

botaoTiro:addEventListener ("tap", atirar)



local mystery = display.newImageRect (grupoMain, "imagens/mystery.png", 493/4, 505/4 )
mystery.x = 30
mystery.y = 300
mystery.myName = "Mystery" -- Usado nas colisões
physics.addBody (mystery, "kinematic") -- Não cai com a gravidade, o dinâmico cai
local direcaoInimigo = "cima"

-- Função para inimigo atirar: 
local function inimigoAtirar ()
	local tiroInimigo = display.newImageRect (grupoMain, "imagens/tiro.png", 348*0.2, 204*0.2)
	tiroInimigo.x = mystery.x + 70
	tiroInimigo.y = mystery.y
	physics.addBody (tiroInimigo, "dynamic", {isSensor=true})
	transition.to (tiroInimigo, {x=400, time=900, onComplete = function () display.remove (tiroInimigo) end})
	tiroInimigo.myName = "AvadaKedavra"
end

-- Criando o timer de disparo do inimigo:
-- Comandos timer: (tempo repetição, 
mystery.timer = timer.performWithDelay (math.random (1000, 1500), inimigoAtirar, 0)

-- Movimentação do inimigo:
local function movimentarInimigo ()
-- se a localização x não for igual a nulo então 
	if not (mystery.x == nil) then
-- Quando a direção do inimigo foi cima 
		if (direcaoInimigo == "cima") then
			mystery.y = mystery.y - 1
-- Se a localização Y do  meu inimigo for menor ou igual a 50 então 
			if (mystery.y <= 50) then
			-- Altera a variável para "baixo"
				direcaoInimigo = "baixo"
			end
-- Se a direção do inimigo for igual a baizo então			
		elseif (direcaoInimigo == "baixo") then
			mystery.y = mystery.y + 1
-- Se a localização y do inimigo for maior ou igual a 400 então
			if (mystery.y >= 400) then
				direcaoInimigo = "cima"
			end
		end
-- Se não 		
	else
		print ("Inimigo morreu!")
-- Runtime: representa todo o jogo (evento é executado para todos), enterFrame: está ligado ao valor de FPS do jogo (frames por segundo), no caso, a função vai ser executada 60 vezes por segundo.
		Runtime:removeEventListener ("enterFrame", movimentarInimigo)
	end
end

Runtime:addEventListener ("enterFrame", movimentarInimigo)

local bgAudio = audio.loadStream ("audio/bg.mp3")
audio.reserveChannels (1)
audio.play (bgAudio, {channel=1, loops=-1})
audio.setVolume (0.4, {channel=1})
audio.play (bgAudio, {channel=1, loops=-1})


local audioFeitico = audio.loadSound ("audio/feitico.mp3")
local parametros = {time = 2000, fadein = 200}

-- Função de colisão: 
local function onCollision (event)
-- Quando a fase de evento for began então 
	if (event.phase == "began") then
-- Variáveis criadas para facilitar a escrita do código
		local obj1 = event.object1
		local obj2 = event.object2
-- Quando o myName do objeto 1 for .. e o nome do obj2 for ...
		if ((obj1.myName == "Stupefy" and obj2.myName == "Mystery"))
		or ((obj1.myName == "Mystery" and obj2.myName == "Stupefy"))
		then
		
			if (obj1.myName == "Stupefy") then

				display.remove (obj1)
			else
				display.remove(obj2)
		end

		pontos = pontos + 10
		pontosText.text = "Pontos: " .. pontos

	elseif ((obj1.myName == "Charmander" and obj2.myName == "AvadaKedavra")	or (obj1.myName == "AvadaKedavra" and obj2.myName == "Charmander")) then
		audio.play (audioFeitico, parametros)
			if (obj1.myName == "AvadaKedavra") then
				display.remove (obj1)
			else
				display.remove (obj2)
			end

		vidas = vidas - 1
		vidasText.text = "Vidas: " .. vidas
		end
	end
end

Runtime:addEventListener ("collision", onCollision) 