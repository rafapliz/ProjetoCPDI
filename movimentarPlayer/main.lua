local bg = display.newImageRect ("imagens/sky.png", 960*3, 240*3)
bg.x = display.contentCenterX
bg.y = display.contentCenterY


local chao = display.newImageRect ("imagens/ground.png", 1028, 256)
chao.x = display.contentCenterX  
chao.y =  490

local player = display.newImageRect ("imagens/player.png", 532/3, 469/3)
player.x = display.contentCenterX
player.y = display.contentCenterY

-- Andar para a direita
local function direita (event)
	player.x = player.x + 4
end

local botaoDireita = display.newImageRect ("imagens/button.png", 1280/20, 1279/20)
botaoDireita.x = 300
botaoDireita.y = display.contentCenterY
botaoDireita:addEventListener ("tap" , direita)

local function esquerda (event)
	player.x = player.x - 4
end

local botaoEsquerda = display.newImageRect ("imagens/button.png", 1280/20, 1279/20)
botaoEsquerda.x = 20
botaoEsquerda.y = display.contentCenterY
botaoEsquerda.rotation = 180

botaoEsquerda:addEventListener ("tap" , esquerda)

local function superior (event)
	player.y = player.y - 4
end

local botaoSuperior = display.newImageRect ("imagens/button.png", 1280/20, 1279/20)
botaoSuperior.x = display.contentCenterX 
botaoSuperior.y = 50
botaoSuperior.rotation = - 90

botaoSuperior:addEventListener ("tap" , superior)

local function inferior (event)
	player.y = player.y + 4
end
local botaoInferior = display.newImageRect ("imagens/button.png", 1280/20, 1279/20)
botaoInferior.x = display.contentCenterX
botaoInferior.y = 440
botaoInferior.rotation = 90

botaoInferior:addEventListener ("tap" , inferior)

local function diagonalInferiorDireita (event)
	player.y = player.y + 4
	player.x = player.x + 4
end
local botaoDiagonalInferiorDireita = display.newImageRect ("imagens/button.png", 1280/20, 1279/20)
botaoDiagonalInferiorDireita.x = 300
botaoDiagonalInferiorDireita.y = 440
botaoDiagonalInferiorDireita.rotation = 45

botaoDiagonalInferiorDireita:addEventListener ("tap" , diagonalInferiorDireita)

local function DiagonalSuperiorDireita (event)
	player.y = player.y - 4
	player.x = player.x + 4
end

local botaoDiagonalSuperiorDireita = display.newImageRect ("imagens/button.png", 1280/20, 1279/20)
botaoDiagonalSuperiorDireita.x = 300
botaoDiagonalSuperiorDireita.y = 50
botaoDiagonalSuperiorDireita.rotation = - 45
botaoDiagonalSuperiorDireita:addEventListener ("tap" , DiagonalSuperiorDireita)

local function diagonalInferiorEsquerda (event)
	player.y = player.y + 4
	player.x = player.x - 4
end
local botaoDiagonalInferiorEsquerda = display.newImageRect ("imagens/button.png", 1280/20, 1279/20)
botaoDiagonalInferiorEsquerda.x = 20
botaoDiagonalInferiorEsquerda.y = 440
botaoDiagonalInferiorEsquerda.rotation = -205

botaoDiagonalInferiorEsquerda:addEventListener ("tap" , diagonalInferiorEsquerda)

local function diagonalSuperiorEsquerda (evet)
	player.y = player.y - 4
	player.x = player.x - 4
end
local botaoDiagonalSuperiorEsquerda = display.newImageRect ("imagens/button.png", 1280/20, 1279/20)
botaoDiagonalSuperiorEsquerda.x = 20
botaoDiagonalSuperiorEsquerda.y = 50
botaoDiagonalSuperiorEsquerda.rotation = -125

botaoDiagonalSuperiorEsquerda:addEventListener ("tap" , diagonalSuperiorEsquerda)