source("functions.m")

% Read the files of the actual folder, and review for graph "pattern"
pattern = "g0????.m";
extension = "eps";
[parta, partb] = system(strcat("dir ", pattern, " /O"));
if (parta == 0)
	parta = partb;
endif



fileNameSize = length(pattern);
destinySize = fileNameSize-length(".m");

% Identify the files to be processed
starts = findstr(parta,"g00", 0);
for i = 1:length(starts)
	filei = substr(parta,starts(i),fileNameSize);
	name = substr(filei,1,destinySize);
	fileo = strcat(name,".",extension);

	figure(1, "visible", "off");
	hold on;
	% Execute an octave file (that plots graphis)
	source(filei);
	% Print an ".eps" file
	print (fileo, strcat("-d", extension));
	disp(strcat(filei, "\t => \t", fileo));
	% Clear the old plots.
	clf;
	hold off;
endfor

disp("Done!");
 
