--------------------------------------------------------------
-- Check if mouse is hovered over the definded bounding box --
--------------------------------------------------------------

function mouseHover(box1x, box1y, box1w, box1h)
    if box1x > love.mouse.getX() + 1 - 1 or -- Is box1 on the right side of box2?
        box1y > love.mouse.getY() + 1 - 1 or -- Is box1 under box2?
        love.mouse.getX() > box1x + box1w - 1 or -- Is box2 on the right side of box1?
        love.mouse.getY() > box1y + box1h - 1    -- Is b2 under b1?
    then
        return false
    else
        return true
    end
end

------------------------------------------------------------
-- Converts HSV to RGB. (input and output range: 0 - 255) -- -- not by me.
------------------------------------------------------------

function HSV(h, s, v)
    if s <= 0 then return v,v,v end
    h, s, v = h/256*6, s/255, v/255
    local c = v*s
    local x = (1-math.abs((h%2)-1))*c
    local m,r,g,b = (v-c), 0,0,0
    if h < 1     then r,g,b = c,x,0
    elseif h < 2 then r,g,b = x,c,0
    elseif h < 3 then r,g,b = 0,c,x
    elseif h < 4 then r,g,b = 0,x,c
    elseif h < 5 then r,g,b = x,0,c
    else              r,g,b = c,0,x
    end return (r+m)*255,(g+m)*255,(b+m)*255
end

--------------------------------------------------------------
-- Define a HSV function used in shaders                    --
--------------------------------------------------------------

hsvSnip = "vec3 hsv(float h,float s,float v) { return mix(vec3(1.),clamp((abs(fract(h+vec3(3.,2.,1.)/3.)*6.-3.)-1.),0.,1.),s)*v; }"

--------------------------------------------------------------
-- Blank image for pixelEffects                             --
--------------------------------------------------------------

blankImg = love.graphics.newImage(love.image.newImageData(1, 1))