--[[
	OP Art by Hearthbreak
	Obtenido de Open Processing.
	Traducido a Diokol por Kevin Jimenez
	Pero sin la función del click, ya que diokol colapsa y no puede procesarlo
--]]


mouseX = 0
mouseY = 0

function setup()
  size(800,600);
end

function draw()
	if mouseX == nil then
		mouseX=0
	end
	if mouseY == nil then
		mouseY=0
	end
  background(0);
  local angle = 0.0;
  --local scaleVal = 60.0/1.5;
  local scaleVal = (mouseX/7.6)/1.5;
  local i = 4;
  local angleInc = PI/i;
  local w = 75/1.5;
  fill(255);
  for y=1, height()+w do
   stroke(130);
   strokeWeight(2);
   line(0,y,800,y);
  end
  
  for offset = 1, width()+w, w*2 do
	angle = 0.0;
    noStroke();
    for y=1, height(), w do
      local x = offset + (math.sin(angle)*scaleVal);
      rect(x,y,w,w);
      angle = angle + angleInc;
    end
  end
  --[[
  if (mousePressed) then 
    background(0);
    local x = 0;
    local y = 0;
    stroke(130);
    strokeWeight(2);
    noStroke();
    if mouseX == nil then
		mouseX=0
	end
	if mouseY == nil then
		mouseY=0
	end
    local scl = w*(math.abs(x-mouseX)/width()*1+0.15);
    local count = 0;
    for x=1, width() do
      scl = w*(math.abs(x-mouseX)/width()*1.4+0.15);
      if (scl>w) then scl=w; end
		if (count%2==0) then
			for y = 1, height(), w*2 do
				fill(255);
				rect(x,y,scl,w);
		end
        else 
           for y = w, height(), w*2 do
           fill(255);
           rect(x,y,scl,w);
		end
     end
      count = count +1 ;
    end
  end--]]
end


function mouseMoved(x,y) 
	mouseX = x
	mouseY = y
end

function mouseDragged(x,y)
	mouseX = x
	mouseY = y
end

function mousePressed()
	return true
end

function mouseReleased()
	return false
end
