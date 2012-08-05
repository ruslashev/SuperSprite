Picker = Class{function(self, x, y, width, height, effectText)
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    self.mousey = love.mouse.getY() - self.y
	
    self.val = 0
    self.val2 = 0
	
    self.mouseOver = false
	
    self.pointery = 0
    self.pointer2y = 0
	
	self.effect = love.graphics.newPixelEffect(hsvSnip..effectText)
end}


function Picker:update()
    self.mousey = love.mouse.getY() - self.y
    
	self.mouseOver = mouseHover(self.x, self.y, self.width, self.height)
	
    if not windowopen then
        if self.mouseOver then
            if love.mouse.isDown("l") then
                self.val = self.mousey / self.height
                self.pointery = love.mouse.getY()
            elseif love.mouse.isDown("r") then
                self.val2 = self.mousey / self.height
                self.pointer2y = love.mouse.getY()
            end
        end
    end
end

function Picker:getPrimary()
    return self.picked.primary
end

function Picker:getSecondary()
    return self.picked.secondary
end

function Picker:draw()
    love.graphics.setColor(255,255,255)
    love.graphics.setLineWidth(1)
	love.graphics.setPixelEffect(self.effect)
	love.graphics.draw(blankImg, self.x, self.y, 0, self.width, self.height)
	love.graphics.setPixelEffect()
	-- frame image
	love.graphics.draw(img_frame_vert, self.x-2, self.y-4)
	
	-- Protip: white anything with black outline is visible on any color. Also applies to text.	
    love.graphics.setColor(0, 0, 0, 255)
	love.graphics.rectangle("line", self.x+1, self.pointery-2, self.width-1, 2)
    love.graphics.setColor(255, 255, 255)
	love.graphics.line(self.x+1, self.pointery-1, self.x+self.width-1, self.pointery-1)
end