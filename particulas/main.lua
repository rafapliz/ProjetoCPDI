local physics = require ("physics")
physics.start()
physics.setDrawMode ("hybrid")

display.setStatusBar (display.HiddenStatusBar)

local chao = display.newRect (display.contentCenterX, 470, 500, 50)
physics.addBody (chao, "static")

local parede1 = display.newRect (-30, display.contentCenterY, 20, 500)
local parede2 = display.newRect (370, display.contentCenterY, 50, 500)
physics.addBody (chao, "static")
physics.addBody (parede1, "static")
physics.addBody (parede2, "static")

local testeParticula = physics.newParticleSystem (
    {
        -- Nome do arquivo de particula
        filename = "imagens/liquidParticle.png", 
        -- radius dísico da partícula
        radius = 2,
        --radius da imagem (usar sempre valor maior que o radius da particula para que ela se sobreponham e traga uma efeito visual satisfatório.)
        imageRadius = 4
    }
)

local function onTimer (event)
    testeParticula:createParticle (
    { -- Determina onde a nova partícula é gerada.
        x = 0,
        y = 0,
        -- Valores iniciais de velocidade para a partícula.
        velocityX = 256,
        velocityY = 480,
        -- Define a cor da partícula RGBA (Cor RGB + Alpha Transparência)
        color = {1, 0.2, 0.4, 1},
        -- Tempo de vida da partícula, quantos segundos ela permanece na tela antes de morrer.
        lifetime = 0,
        -- Define o comportamento da partícula
        flags = {"water", "colorMixing"}
    })
end
timer.performWithDelay (20, onTimer, 0)

testeParticula:createGroup (
    {
        x = 50,
        y = 0,
        color = {0, 0.3, 1, 1},
        halfWidth = 64,
        halfHeight = 32,
        flags = {"water", "colorMixing"}
    }
)
testeParticula:applyForce (0, -9.8*testeParticula.particleMass)