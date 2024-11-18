{
   4.- Escribir un programa que:
		a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100. 
		b. Implemente un módulo recursivo que devuelva el máximo valor del vector. 
		c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector.

   
}


program untitled;
const
	dimf=20;
type
	vector=array[1..dimf]of integer;

procedure cargar(var v:vector);
	procedure recursion(var v:vector;var diml,n:integer);
		begin
			n:=Random(99)+1;
			if(diml<=dimf)then begin
				diml:=diml+1;
				v[diml]:=n;
				recursion(v,diml,n);
			end;
		end;
	var
		diml,n:integer;
	begin
		Randomize;
		diml:=0;
		recursion(v,diml,n);
	end;
procedure recorrer(v:vector;var min,max:integer;var i:integer);
	begin
		if(i<=dimf)then begin
			writeln(v[i]);
			if(min>v[i])then min:=v[i];
			if(max<v[i])then max:=v[i];
			i:=i+1;
			recorrer(v,min,max,i);
		end;
	end;
var
	v:vector;
	min,max,i:integer;
BEGIN
	min:=100;
	max:=0;
	cargar(v);
	i:=1;
	recorrer(v,min,max,i);
	writeln(min,' ',max)
END.

