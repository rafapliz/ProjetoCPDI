local Teclado = {} -- Armazena todos os dados do script 

function Teclado.novo (player)

    local function verificarTecla (event)
        -- Se a fase de evento for down (tecla pressionada) então 
        if event.phase == "down" then
            -- se a tecla pressionada for o d então
            if event.keyName == "d" then
                player.direcao = "direita"
                player:setSequence ("correndo")
                player:play()
                player.xScale = 1       
            elseif event.keyName == "a" then
                player.direcao = "esquerda"
                player:setSequence ("correndo")
                player:play()
                player.xScale = -1
            elseif event.keyName == "space" then
                player.numeroPulo = player.numeroPulo + 1
                -- Se numeroPulo for igual a 1 então
                    if player.numeroPulo == 1 then
                        -- é aplicado impulso linear no player (y)
                        player:applyLinearImpulse (0, -0.4, player.x, player.y)
                    -- se o numeroPulo for ihual a 2 então
                    elseif player.numeroPulo == 2 then
                        -- Transição para o player girar 460 graus em torno do próprio eixo
                        transition.to (player, {rotation=player.rotation+360, time=750})
                        player:applyLinearImpulse (0, -0.4, player.x, player.y)
                    end
            end
        -- quando a fase de evento for up então
        elseif event.phase == "up" then
            if event.keyName == "d" then
                player.direcao = "parado"
                player:setSequence("parado")
                player:play()
            elseif event.keyName == "a" then
                player.direcao = "parado"
                player:setSequence("parado")
                player:play()
            end
        end 
    end
        Runtime:addEventListener ("key", verificarTecla)

    local function verificarDirecao ()
        local velocidadeX, velocidadeY = player:getLinearVelocity()
        --print ("Velocidade X: " .. velocidadeX .. ", velocidade Y: " .. velocidadeY)
        if player.direcao == "direita" and velocidadeX <= 200 then
            player:applyLinearImpulse (0.1, 0, player.x, player.y)
        elseif player.direcao == "esquerda" and velocidadeX >= -200 then
            player:applyLinearImpulse (-0.1, 0, player.x, player.y)
        end 
    end 
    --"enterFrame" - executa a função o numero de fps/s (nesse caso 60x por segundo)
    Runtime:addEventListener ("enterFrame", verificarDirecao)
end

return Teclado -- "Fechar string teclado"