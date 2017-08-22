function [ encrypted ] = testEnigmaBidirectional (key, plaintext, plugboard)
  % Set rotors
  left = evalin('base','rotor1');
  middle = evalin('base','rotor2');
  right = evalin('base','rotor3');
  reflector = evalin('base','umkehrwalzeB');
  
  turnovers = [evalin('base','rotorTurnovers(1,:)'); evalin('base','rotorTurnovers(2,:)'); evalin('base','rotorTurnovers(3,:)')];
  rotate = evalin('base','rotate');
  
  pos = key - 'A';
  
  for c = plaintext
    pos = calcRotorPosition(pos, turnovers);
    
    rotateRight = rotate^pos(3);
    rotateMiddle = rotate^pos(2);
    rotateLeft = rotate^pos(1);
    
    e = (plugboard * (rotateRight' * (right^(-1)) * rotateRight) * (rotateMiddle' * (middle^(-1)) * rotateMiddle) ...
        * (rotateLeft' * (left^(-1)) * rotateLeft) * reflector * (rotateLeft' * left * rotateLeft)...
        * (rotateMiddle' * middle * rotateMiddle) * (rotateRight' * right * rotateRight)...
        * plugboard);
    disp(all(all((e*e)==eye(26))));
    
  end
end