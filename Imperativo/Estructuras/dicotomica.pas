program untitled;

function dicotomica(v:vector;ini,fin,diml,dato:integer;var pos:integer):integer;
	var
		control:boolean;
		medio:integer;
	begin
		pos:=0;
		control:=true;
		while(control)and(ini<=fin)do begin
			medio:=(ini+fin)/2;
			if(v[medio]=dato)then begin
				pos:=medio;
				control:=false;
				dicotomica:=pos;
			end
			else
				if(dato<v[medio])then
					dicotomica:=dicotomica(v,ini,medio-1,diml,dato,pos)
				else
					dicomica:=dicotomica(v,medio+1,fin,diml,dato,pos );
		end;
	end;
var 

BEGIN
	
	
END.

