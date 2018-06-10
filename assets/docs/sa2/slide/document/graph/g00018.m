
function drawMap(x,y,values)
	axis([x(1)-1,x(length(x))+1,y(1)-1,y(length(y))+1],"square")
	for i = x
		for j = y
			if values(i,j) != "x"
				text (i, j, values(i,j), "fontsize", 20);
			endif
		endfor
	endfor
endfunction

values = ["1","x","2","1","2";
	  "3","1","2","x","1";
	  "1","2","x","2","2";
	  "x","x","2","x","3";
	  "1","2","2","x","3";
	  ];
hold on
drawMap(1:1:5,1:1:5,values)
hold off



