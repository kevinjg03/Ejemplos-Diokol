local mass = {};
local positionX = {};
local positionY = {};
local velocityX = {};
local velocityY = {};

--/////////////////////////////////////////////////////////////////////////////////////////////////////

function setup()
	size(600, 600);
	noStroke();
	fill(64, 255, 255, 192);
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////

function draw() 
	background(32);
		for particleA = 1, #mass do
			local accelerationX = 0;
			local accelerationY = 0;
		
			for particleB = 1, #mass do
				if (particleA ~= particleB) then
					local distanceX = positionX[particleB] - positionX[particleA];
					local distanceY = positionY[particleB] - positionY[particleA];

					local distance = math.sqrt(distanceX * distanceX + distanceY * distanceY);
					if (distance < 1) then distance = 1 end;

					local force = (distance - 320) * mass[particleB] / distance;
					accelerationX = accelerationX + force * distanceX;
					accelerationY = accelerationY + force * distanceY;
				end
			end
		
			velocityX[particleA] = velocityX[particleA] * 0.89 + accelerationX * mass[particleA];
			velocityY[particleA] = velocityY[particleA] * 0.89 + accelerationY * mass[particleA];
		end
	
		for particle = 1, #mass do
			positionX[particle] = (positionX[particle] + velocityX[particle])--%width();
			positionY[particle] = (positionY[particle] + velocityY[particle])--%height();
		
			ellipse(positionX[particle], positionY[particle], mass[particle] * 20, mass[particle] * 20);
		end
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////

function addNewParticle() 
	if (mouseX ~= nil) and (mouseY~=nil) then
	mass[#mass+1] = (math.random(0.003, 0.03));
	positionX[#positionX+1] = mouseX;
	positionY[#positionY+1] = mouseY;
	velocityX[#velocityX+1] = 0;
	velocityY[#velocityY+1] = 0;
	end
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////

function mouseClicked(x, y)
	addNewParticle();
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////

function mouseDragged(x,y) 
	mouseX = x
	mouseY = y
	addNewParticle();
end

function mouseMoved(x,y)
	mouseX = x
	mouseY = y
end


	
