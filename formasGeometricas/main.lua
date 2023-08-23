local retangulo = display.newRect(100, 100, 180, 100)
retangulo:setFillColor (0.9, 0.9, 0.5)

local circulo = display.newCircle (300, 100, 50)
local corCirculo = {

    type = "gradient",
    color1 = {1, 0, 0.3},
    color2 = {0.4, 0.6, 0.5},
    direction = "down",
}
circulo:setFillColor (corCirculo)


local quadrado = display.newRect(450, 100, 100, 100)
quadrado:setFillColor (0.9, 0.4, 0.2)

-- Adicionar retângulo arredondado:
-- display.newRoundedRect (x, y, largura, altura, raio das bordas)

local retanguloArredondado = display.newRoundedRect (700, 100, 200, 100, 30)
local corRetanguloArredondado = {

    type = "gradient",
    color1 = {0.5, 0.7, 0.4},
    color2 = {0.5, 0.3, 0.2},
    direction = "up"
}
retanguloArredondado:setFillColor (corRetanguloArredondado)

-- Adicionar uma linha:
-- Comandos: display.new.Line (xInicial, yInicial, xfinal, yFinal)

local linha = display.newLine (0, 200, 1200, 200)

-- Criar um polígono 
-- Comandos: display.newPolygon (x, y, vertices)

local localizacaoX = 200
local localizacaoY = 350

local vertices = {0, -110, 27, -35, 105, -35, 43, 16, 65, 90, 0, 45, -65, 90, -43, 15, -105, -35, -27, -35}

local estrela = display.newPolygon (localizacaoX, localizacaoY, vertices)

-- Criar um novo texto:
-- Comandos: display.newText ("Texto que quero inserir", x, y, fonte, fontsize)

local helloWorld = display.newText ("Hello World!", 500, 350, native.systemFont, 50)

local parametros = {
    text = "Olá mundo!",
    x = 500,
    y = 450,
    fontSize = 50,
    align = "right",
}

local olaMundo = display.newText (parametros)
olaMundo:setFillColor (0.1, 0.5, 1)

-- Adicionar texto em relevo:
-- Comandos: display.newEmsossedText ()

local opcoes = {
    text = "Juliana",
    x = 750,
    y = 450,
    font = "Arial",
    fontSize = 70, 
}

local textoRelevo = display.newEmbossedText (opcoes)
 
-- Adicionar cor ao objetivo/texto:
-- Comandos: variavel:setFillColor (cinza, vermelho, verde, azul, alpha)

helloWorld:setFillColor (0.9, 0.4, 0.5)
helloWorld.alpha = 0.5

local color = {
    -- destaque
    highlight = {r = 0, g = 1, b = 0},
    -- sombra
    shadow = {r = 0.3, g = 0.9, b = 0.2}
}
textoRelevo:setEmbossColor (color)

-- Gradiente: 
-- Comandos: variável = { tyoe =, color1 = { , , }, color2= { , , } direction = ""}

local gradiente = {
    type = "gradient",
    color1 = {1, 0.1, 0.9},
    color2 = {0.8, 0.8, 0.8},
    direction = "down"
}
estrela:setFillColor (gradiente)


