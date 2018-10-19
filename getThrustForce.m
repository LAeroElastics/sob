function [ft] = getThrustForce(ft,theta)
ft=[ft*cos(theta),0,-ft*sin(theta)];
end

