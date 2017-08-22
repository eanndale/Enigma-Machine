function [ phraseMat ] = matenc (phrase)
	phraseMat = [];
	
	for c = phrase
		cVec = zeros(26,1);
		cVec((c - 'A') + 1, 1) = 1;
		phraseMat = [phraseMat cVec];
	end
end