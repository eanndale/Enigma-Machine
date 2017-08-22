initialPos = 'ALM';
turnover = [rotorTurnovers(6,:); rotorTurnovers(7,:); rotorTurnovers(8,:)];
pos = [initialPos(1)-'A' initialPos(2)-'A' initialPos(3)-'A'];

for t = [0:3]
  pos = calcRotorPosition(pos, turnover);
  
  rightWindow = matdec((rotate^pos(3)) * matenc('A'));
  middleWindow = matdec((rotate^pos(2)) * matenc('A'));
  leftWindow = matdec((rotate^pos(1)) * matenc('A'));
  
  disp(pos);
  
  disp(char([leftWindow middleWindow rightWindow]));
end