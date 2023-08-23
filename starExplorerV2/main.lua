local composer = require ("composer")

display.setStatusBar (display.HiddenStatusBar)

math.randomseed (os.time())
audio.reserveChannels (1, 2)
audio.setVolume (0.5, {channel=1})
audio.setVolume (0.1, {channel=2})

-- Comando que inicia a cena inicial.
composer.gotoScene ("menu")
