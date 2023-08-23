
local composer = require( "composer" )

local scene = composer.newScene()

local fundo

-- -----------------------------------------------------------------------------------
--O código fora das funções de evento de cena abaixo será executado apenas UMA VEZ, a menos que
-- a cena é totalmente removida (não reciclada) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local json = require ("json") -- Chama a biblioteca json para a cena
local pontosTable = {} -- String/tabela que irá conter as pontuações guardadas.
local filePath = system.pathForFile ("pontos.json", system.DocumentsDirectory) -- Cria o arquivo pontos.json e determina o caminho onde o arquivo será armazenado

local function carregaPontos()
	-- Verifica se o arquivo existe abrindo-o somente para leiura.
	local pasta = io.open (filePath, "r") -- "r" == somente leitura

	if pasta then
		local contents = pasta:read ("*a") -- Extrai os dados do arquivo e grava na variavel contents (formato JSON)
		io.close (pasta) -- fecha o arquivo pontos.json
		pontosTable = json.decode (contents) -- Decodificar a variavel contents de json para Lua e armazena-los na tabela
	end
	if (pontosTable == nil or #pontosTable == 0) then -- Se a tabela não existir ou estiver vazia (# == indice da tabela ou total de dados.)
		pontosTable = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0} -- Define as pontuações iniciadas.
	end
end
local function salvaPontos ()
	for i = #pontosTable, 11, -1 do -- Define que apenas 10 valores podem ser salvos na pontosTable.
		table.remove (pontosTable, i) --Remove os dados 11 acima
	end
-- Abre o arquivo pontos.json para alterações.
local pasta = io.open (filePath, "w") --("w" == acesso de gravação)

	if pasta then 
	-- Inclui os dados da pontosTable no arquivo pontos.json codificada para JSON
	pasta:write (json.encode(pontosTable))
	io.close (pasta) -- Fecha o arquivo pontos.json
	end
end

local function gotoMenu ()
	composer.gotoScene ("menu", {time=800, effect="crossFade"})
end
-- -----------------------------------------------------------------------------------
-- Funções de evento de cena
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
	fundo = audio.loadStream ("audio/Midnight-Crawlers_Looping.wav")
	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	carregaPontos() --Executa a função que extrai as pontuações anteriores.
	
	--Acrescenta a pontuação da partida na tabela.
	table.insert (pontosTable, composer.getVariable("scoreFinal"))

	composer.setVariable ("scoreFinal", 0) -- Redefine o valr da variável.

	local function compare (a, b) 
	-- Organiza os elementos da  pontosTable do maior para o menor.
		return a > b 
	end

	table.sort (pontosTable, compare) --Classifica a ordem definida na function compare para a pontosTable

	salvaPontos() -- Salva os dados atualziados no arquivo JSON

	local bg = display.newImageRect (sceneGroup, "imagens/bg.png", 800, 1400)
	bg.x, bg.y = display.contentCenterX, display.contentCenterY

	local cabecalho = display.newText (sceneGroup, "Recordes", display.contentCenterX, 100, native.systemFont, 80)
	cabecalho:setFillColor (0.75, 0.78, 1)

	--Cria um loop de 1 a 10
	for i = 1, 10 do
		-- Atribui os valores da pontosTable como os do loop
		if (pontosTable[i]) then
			-- Definindo que o espaçamento das pontuações seja uniforme de acordo com o número.
			local yPos = 150 + (i*56)

			local ranking = display.newText (sceneGroup, i .. ")", display.contentCenterX-100, yPos, native.systemFont, 44)
			ranking:setFillColor (0.8)

			ranking.anchorX = 1 -- Alinha o texto a direita alrterando a âncora.
 
			local finalPontos = display.newText (sceneGroup, pontosTable[i], display.contentCenterX-50, yPos, native.systemFont, 44)
			finalPontos.anchorX = 0
		end
	end
	local menu = display.newText (sceneGroup, "Menu", display.contentCenterX, 810, native.systemFont, 50)
	menu:setFillColor (0.75, 0.78, 1)
	menu:addEventListener ("tap", gotoMenu)
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase
	audio.play (fundo, {channel=1, loops=-1})
	if ( phase == "will" ) then
		--O código aqui é executado quando a cena ainda está fora da tela (mas está prestes a aparecer na tela)


	elseif ( phase == "did" ) then
		-- O código aqui é executado quando a cena está inteiramente na tela


	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- O código aqui é executado quando a cena está na tela (mas está prestes a sair da tela)

	elseif ( phase == "did" ) then
		-- O código aqui é executado imediatamente após a cena sair totalmente da tela
	composer.removeScene("recordes")
	audio.stop (1)
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
-- O código aqui é executado antes da remoção da visualização da cena
	audio.dispose (fundo)
end


-- -----------------------------------------------------------------------------------
-- Ouvintes de função de evento de cena
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
