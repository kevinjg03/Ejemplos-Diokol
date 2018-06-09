--[[
	Primary Spirals by James Coviello
	Traducido a Diokol por Kevin Jiménez
	El background puede presentar problemas al desplegarse por primera vez, pero una vez que se presione click en la pantalla se soluciona
--]]

local mousedown = false

function setup() 
    size(600,600);
    background(0);
    --angleMode(DEGREES);
    ellipseMode(CORNER); -- -- Set ellipseMode is CORNER
end

function draw()
	--background(0);
    local branch = 5;
    local myColors = {'#ff0000','#0099ff','#ffff00','#ffffff','#b3b3b3'};
    local green ='#9ef957';
    if(mousedown) then
        --if (mouseButton == LEFT)
			for j=1, branch do  --repeat five times
				local myColorIndex =  math.random(1,5) --0,1,2,3 or 4
				
				stroke(myColors[myColorIndex]); --pick my color
				if mouseX == nil then mouseX = 0 end
				if mouseY == nil then mouseY = 0 end
				translate(mouseX, mouseY);
				rotate(360/branch*j);
				for i=1, math.random(2,65) do--for each branch
					local lineAngle = math.random(0,90);
					translate(0, i);
					rotate(lineAngle);
                
        
					strokeWeight(1);
                
					stroke(myColors[myColorIndex]); --pick my color             
					fill(green);
					ellipse(25, 25, 10, 10);  -- Draw white ellipse using CORNER mode

					noFill();
					ellipse(25, 25, 90, 90);  -- Draw gray ellipse using CORNERS mode


                
					rotate(-lineAngle);
					translate(0, -i);
                
				end
            rotate(-360/branch*j);
            translate(-mouseX, -mouseY);
            
        end
    end
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
