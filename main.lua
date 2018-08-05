player = {
  x = 5,
  y = 3
}

height = 5
width = 10
gridSize = 32

mapSequence = {
  one,
  two,
  three
}

function askForMap(input)
  if input == one then

  end
end

map = {
  one = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 0, 0, 1, 0, 1, 1},
    {1, 1, 1, 0, 0, 1, 0, 0, 1},
    {1, 1, 1, 0, 1, 1, 0, 1, 1},
    {1, 1, 1, 0, 0, 0, 0, 1, 1},
    {1, 1, 1, 1, 1, 0, 1, 1, 1},
    {1, 0, 0, 0, 1, 0, 1, 1, 1},
    {1, 0, 1, 0, 1, 0, 1, 1, 1},
    {1, 0, 1, 0, 0, 0, 1, 1, 1},
    {1, 0, 1, 1, 1, 0, 0, 1, 1},
    {1, 0, 1, 0, 0, 1, 0, 1, 1},
    {1, 0, 0, 0, 1, 1, 0, 1, 1},
    {1, 1, 1, 1, 1, 1, 0, 1, 1},
    {1, 1, 0, 0, 0, 1, 0, 1, 1},
    {1, 0, 0, 1, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1},
  },

  two = {
    {1, 0, 0, 0, 1, 0, 1, 1, 1},
    {1, 0, 0, 0, 1, 0, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 1, 1, 1},
    {1, 0, 0, 0, 1, 0, 1, 1, 1},
    {1, 0, 0, 0, 1, 0, 1, 1, 1},
    {1, 0, 0, 0, 1, 0, 1, 1, 1},
    {1, 0, 0, 0, 1, 0, 1, 1, 1},
    {1, 0, 0, 0, 1, 0, 1, 1, 1},
  }

}

function drawArea()
  for j = 1, height do
    for i = 1, width do

      if i == player.x and j == player.y then

        love.graphics.setColor(0, 0, 255, 100)
        love.graphics.rectangle("fill", gridSize * (i - 1) + 2, gridSize * (j - 1) + 2, gridSize - 4, gridSize - 4)

      else

        love.graphics.setColor(0, 255, 255, 100)

end

    end
  end
end

function love.draw()
  love.graphics.setBackgroundColor(255, 255, 255, 1)
  --drawArea()


	for y=1, #map.one do
		for x=1, #map.one[y] do
			if map.one[y][x] == 1 then
        love.graphics.setColor(0, 255, 255, 100)
				love.graphics.rectangle("fill", gridSize * (x - 1) + 2, gridSize * (y - 1) + 2, gridSize - 4, gridSize - 4)
			end
		end
	end

  love.graphics.setColor(0, 0, 255, 100)
  love.graphics.rectangle("fill", gridSize * (player.x - 1) + 2, gridSize * (player.y - 1) + 2, gridSize - 4, gridSize - 4)
end

function testMap(x, y)
	if map.one[(player.y) + y][(player.x) + x] == 1 then
		return false
	end
	return true
end

function love.keypressed(key, scancode, isrepeat)
  -- body...
end

function love.update()
  if love.keyboard.isDown("lshift") and love.keyboard.isDown("up") then
    love.keypressed("up")
  end

  if love.keyboard.isDown("lshift") and love.keyboard.isDown("down") then
    love.keypressed("down")
  end

  if love.keyboard.isDown("lshift") and love.keyboard.isDown("left") then
    love.keypressed("left")
  end

  if love.keyboard.isDown("lshift") and love.keyboard.isDown("right") then
    love.keypressed("right")
  end
end

function love.keypressed(key)

  if key == "up" then
    if testMap(0, -1) then
			player.y = player.y - 1
		end
  end

  if key == "down" then
    if testMap(0, 1) then
      player.y = player.y + 1
    end

  end

  if key == "left" then
    if testMap(-1, 0) then
     player.x = player.x - 1
    end
  end

  if key == "right" then
    if testMap(1, 0) then
      player.x = player.x + 1
    end
  end
end
