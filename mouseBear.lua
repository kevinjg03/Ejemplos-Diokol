--Mouse Bear By Tim Groote
--Recreado por Kevin Jiménez Garro

--Presenta diferencias, aparentemente, Diokol computa diferente a processing ciertas funciones


function setup() 
  size(800, 640);
end

function draw() 
	if (mouseX == nil) then
		mouseX = 0;
	end
	if (mouseY == nil) then
		mouseY = 0
	end
  local mouseXD = mouseX - (width()/2);
  local mouseYD = mouseY - (height()/2);
	
  background(255);
  fill(0);
  egg(width()/2, height()/2, PI, 1, 0, 100, 2, mouseXD, mouseYD); --//head ?
  egg(width()/2, height()/2+10,0,0.4,255,100, 4, mouseXD, mouseYD);-- //nose?
	
--	//eyes?
  egg(width()/2-50, height()/2-35, PI/3 , 0.08, 255,100, 2, mouseXD, mouseYD);
  egg(width()/2+50, height()/2-35, -PI/3, 0.08, 255, 100, 2, mouseXD, mouseYD);
	
--	//ears!
  egg(width()/2-95, height()/2-65,-PI/4,0.2,0,100, -1, mouseXD, mouseYD);
  egg(width()/2+95, height()/2-65, PI/4,0.2,0,100, -1, mouseXD, mouseYD);
  
  fill(0);
  ellipse(width()/2 + (mouseXD * 0.08), height()/2-20 + (mouseYD *0.08),40,23);
  
--	//nostrils // todo : these need clipping.
	fill(255);
	
  ellipse((width()/2-15) + mouseXD * 0.08, (height()/2-10) + mouseYD *0.08,20,20);
  ellipse((width()/2+15) + mouseXD * 0.08, (height()/2-10) + mouseYD *0.08,20,20);
  
  fill(0);
  ellipse((width()/2) + mouseXD *0.08,(height()/2+24) + mouseYD *0.08,60,30);
end

--//ref - https://cdn.dribbble.com/users/31664/screenshots/1525046/cub-studio-logos-retime-2.gif


function egg(posx,posy,ang,size,val,x, depth)  
  fill(val);
  noStroke(); 
  --//egg
  pushMatrix();
  translate(posx + (mouseX-(width()/2)) * (depth/50), posy + (mouseY-(height()/2)) * (depth/100));
  rotate(ang);
  scale(size); 
  fill(val);
  arc(0, 0, 2*x, 1.5*x, 0, PI,CHORD);
  arc(-x, 0, 4*x, 4*x, 7*PI*.25, 2*PI,CHORD);
  arc(x, 0, 4*x, 4*x, PI, 5*PI*.25, CHORD);
  arc(0, -x, (((2*x * math.sin(radians (45)))-x)/ math.sin(radians (45)))*2, (((2*x *math.sin (radians (45)))-x)/ math.sin (radians (45)))*2, 5*PI*.25, 7*PI*.25, CHORD );
  popMatrix();
end

function mouseMoved(x,y)
	mouseX = x
	mouseY = y
end
