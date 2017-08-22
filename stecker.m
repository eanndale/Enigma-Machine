function [ plugboard ] = stecker (varargin)
  plugboard = eye(26);
  
  for steckerCell = varargin
    stecker = cell2mat(steckerCell);
    steckerCols = [matenc(stecker(1)) matenc(stecker(2))];
    
    plugboard(logical(steckerCols(:,1)'), logical(steckerCols(:,1))) = 0;
    plugboard(logical(steckerCols(:,2)'), logical(steckerCols(:,2))) = 0;
    
    plugboard(logical(steckerCols(:,1)'), logical(steckerCols(:,2))) = 1;
    plugboard(logical(steckerCols(:,2)'), logical(steckerCols(:,1))) = 1;
  end
end