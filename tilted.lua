--[[
Tilted by Merav Kleinmann 
Traducido a Diokol por Kevin Jiménez
--]]


local mousedown = false

function setup() 
  size(800, 800); 
   background(255);
  --color(HSB,360,100,100,100);
 end

function draw() 
  if mouseX == nil then mouseX = 0 end
  if mouseY == nil then mouseY = 0 end
  local s= os.time();
  if (mousedown) then
  stroke(s*30,5000,2000);
  else
  stroke(s*6,50,100);
  end
  line(mouseX,mouseY,30,mouseX);
end

function mousePressed() 
	mousedown = true
end

function mouseReleased()
	mousedown = false
end


function mouseMoved(x,y) 
	mouseX = x
	mouseY = y
end

function mouseDragged(x,y)
	mouseX = x
	mouseY = y
end
