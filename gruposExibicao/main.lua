-- Criando grupos de exibição

local backGroup = display.newGroup () -- Back usado para plano de fundo, decorações que não terão interação com o jogo.

local mainGroup = display.newGroup () -- Usado para os objetos que terão interação dentro do jogo, grupo principal

local uiGroup = display.newGroup () -- Utilizado para placar, vidas, texto, que ficarão na frente do jogo, porém sem interação.

-- Método embutido:
-- Inclui o objeto no grupo já na sua criação

local bg = display.newImageRect (backGroup, "imagens/bg.jpg", 509*2, 339*2)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local chao = display.newImageRect ("imagens/chao.png", 4503*0.1, 613*0.1)
chao.x = display.contentCenterX  
chao.y = display.contentCenterY + 215
mainGroup:insert (chao)

local cloud = display.newImageRect ("imagens/cloud.png", 2360/7, 984/7)
cloud.x = display.contentCenterX - 90 
cloud.y = display.contentCenterY - 150
backGroup:insert (cloud)

local sol = display.newImageRect (backGroup, "imagens/sun.png", 256/2, 256/2)
sol.x = display.contentCenterX + 110
sol.y = display.contentCenterY -170

local arvore1 = display.newImageRect (mainGroup, "imagens/tree.png", 1024/6, 1024/6)
arvore1.x = display.contentCenterX - 100
arvore1.y = display.contentCenterY + 150

local arvore2 = display.newImageRect ("imagens/tree.png", 1024/6, 1024/6)
arvore2.x = display.contentCenterX + 100
arvore2.y = display.contentCenterY + 150
mainGroup:insert (arvore2)

chao:toFront ()
