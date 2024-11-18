{
   5.- Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el siguiente encabezado:
	   Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice); 

	Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra en el vector.

   
}


program untitled;
const
	dimf=20;
type
	vector=array[1..20]of integer;
procedure cargar(var v:vector);
	procedure inicializar(var v:vector);
		var i:integer;
		begin
			for i:=1 to dimf do v[i]:=0;
		end;
	procedure ordenado(var v:vector;n:integer);
		var
			pos,i:integer;
		begin
			i:=1;
			while(i<=dimf)and(n>v[i])do begin
				i:=i+1;
			end;
			if(i<dimf)then begin
				pos:=i;
				for i:=dimf downto pos do v[i]:=v[i-1];
				v[pos]:=n
			end
			else writeln('lleno');
		end;
	var
		i,n:integer;
	begin
		Randomize;
		inicializar(v);
		for i:=1 to dimf do begin
			n:=Random(15);
			ordenado(v,n);
		end;
	end;
	
	function busquedaDicotomica(v:vector; ini,fin,dato:integer;var pos:integer):integer;
		var
			control:boolean;
			medio:integer;
		begin
			pos:=0;
			control:=true;
			while(control) and (ini<=fin)do begin
				medio:=(ini+fin)div 2;
				if(v[medio]=dato)then begin
					pos:=medio;
					control:=false;
				end
				else begin
					if(dato<v[medio])then busquedaDicotomica:=busquedaDicotomica(v,ini,medio-1,dato,pos)
					else busquedaDicotomica:= busquedaDicotomica(v,medio+1,fin,dato,pos);
				end;
			end;
		end;
var 
	v:vector;
	ini,fin,pos,dato:integer;
BEGIN
	cargar(v);
	ini:=1;
	fin:=dimf;
	writeln('ingrese dato a buscar');readln(dato);
	busquedaDicotomica(v,ini,fin,dato,pos);
	
END.

