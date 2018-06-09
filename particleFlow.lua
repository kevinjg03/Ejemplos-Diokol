--Particle Flow
--By Yasai
-- Recreado por
-- Kevin Jiménez

--[[
No es estrictamente igual, debido a que Diokol y lua carecen de métodos para obtener milisegundos
--]]


local circle = 200;
local rot = 0;
local col;
local freq = 5; 
local cont = 0;
local r;

function setup() 
  size(600, 600);
end

function draw() 
  background(242);
  translate(300, 300);
  rotate(radians(rot));
  ellipseMode(RADIUS);
  for i=1, 550 do
    circle= 200 + 50*math.cos((os.time()%100) *freq*i);
    col=map(circle,150,250,255,60);
    r=map(circle,150,250,5,2);
    fill(col,0,74);
    noStroke();
    ellipse(circle*math.cos(i), circle*math.sin(i),r,r);    
    rot=rot+0.00005;
  end
end

