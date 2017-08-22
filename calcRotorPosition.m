function [newPos] = calcRotorPosition (pos, turnovers)
  newPos(3) = mod(pos(3) + 1, 26);
  
  for i = 2:-1:1
    newPos(i) = pos(i);
    
    if (sum(newPos(i+1) == (turnovers(i+1,:) - 'A')) >= 1) newPos(i) = newPos(i) + 1;
    else if ((sum(mod(newPos(i) + 1, 26) == (turnovers(i,:) - 'A')) >= 1) && i ~= 1)
      newPos(i) = newPos(i) + 1;
    end
  end
  
  newPos = mod(newPos, 26);
end