function [ rotor ] = createRotor (encodeTo)
   rotor = zeros(length(encodeTo), length(encodeTo));
   
   for i = [1:length(encodeTo)]
   	rotor((encodeTo(i) - 'A') + 1, i) = 1;
   end
end
