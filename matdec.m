function [ phrase ] = matdec (phraseMat)
	phrase = '';
	
	for c = [1:size(phraseMat,2)]
		for p = [1:size(phraseMat,1)]
			if (phraseMat(p,c) == 1)
				phrase = [phrase char('A' + (p - 1))];
			end
		end
	end
end