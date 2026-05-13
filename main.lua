function love.load()
    figuras = {} ----se guardan los elementos de la tabla

    -- Creacion de los 20 círculos
    for i = 1, 20 do
        --se agregan nuevos elementos a la tabla
        table.insert(figuras, {
            x = math.random(50, 750), 
            y = math.random(50, 550),
            radio = math.random(10, 25),
            --velocidad aleatoria de los elementos
            dx = math.random(-4, 4),
            dy = math.random(-4, 4),
            r = math.random(),
            g = math.random(),
            b = math.random()
        })
    end
end

function love.update(dt)
    for i, figura in ipairs(figuras) do         --hace recorrido de todos los elementos
        figura.x = figura.x + figura.dx
        figura.y = figura.y + figura.dy

        -- Rebote horizontal actualiza posicion
        if figura.x - figura.radio <= 0 or figura.x + figura.radio >= 800 then
            figura.dx = -figura.dx
        end

        -- Rebote vertical
        if figura.y - figura.radio <= 0 or figura.y + figura.radio >= 600 then
            figura.dy = -figura.dy
        end
    end
end

function love.draw()
    for i, figura in ipairs(figuras) do   --hace recorrido de los lementos
        love.graphics.setColor(figura.r, figura.g, figura.b)
        love.graphics.circle("fill", figura.x, figura.y, figura.radio)
    end

   
end
