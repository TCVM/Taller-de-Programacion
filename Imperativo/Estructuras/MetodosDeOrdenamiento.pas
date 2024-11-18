program untitled;

procedure seleccion(var v:vector;diml:integer);
	var
		i,j,p:integer;
		item:dato;
	begin
		for i:=1 to diml-1 do begin
			p:=i;
			for j :=i+1 to diml do if(v[j]<v[p])then p:=j;
			item:=v[p];
			v[p]:=v[i];
			v[i]:=item;
		end;
	end;
	
procedure insercion(var v:vector;diml:integer);
	var
		i,j:integer;
		actual:dato;
	begin
		for i:=2 to diml do begin
			actual:=v[i];
			j:=i-1;
			while(j>0)and(v[j]>actual)do begin
				v[j+1]:=v[j];
				j:=j-1;
			end;
			v[j+1]:=actual;
		end;
	end;
var

BEGIN
	
	
END.

