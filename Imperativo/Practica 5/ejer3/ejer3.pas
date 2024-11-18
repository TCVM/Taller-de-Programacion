{
   3.- Un supermercado requiere el procesamiento de sus productos. De cada producto se conoce código, rubro (1..10), stock y precio unitario.
		Se pide:
		a)	Generar una estructura adecuada que permita agrupar los productos por rubro. A su vez, para cada rubro, se requiere que la 
			búsqueda de un producto por código sea lo más eficiente posible. La lectura finaliza con el código de producto igual a -1..
		b)	Implementar un módulo que reciba la estructura generada en a), un rubro y un código de producto y retorne si dicho código existe
			o no para ese rubro.
		c)	Implementar un módulo que reciba la estructura generada en a), y retorne, para cada rubro, el código y stock del producto con 
			mayor código.
		d)	Implementar un módulo que reciba la estructura generada en a), dos códigos y retorne, para cada rubro, la cantidad de productos
			con códigos entre los dos valores ingresados.
}


program untitled;
type
	rango=1..10;
	producto=record
		cod,stock:integer;
		rubro:rango;
		precio:real;
	end;
	arbol=^nodo;
	nodo=record
		dato:producto;
		HI,HD:arbol;
	end;
	puntoC=record
		cod,stock:integer;
	end;
	vector=array[rango]of arbol;
	vectorR=array[rango]of puntoC;
	vectoracu=array[rango]of integer;

procedure cargarvector(var v:vector);
	procedure crearnodo(var a:arbol;p:producto);
		begin
			if(a=nil)then begin
				new(a);
				a^.dato:=p;
				a^.HI:=nil;
				a^.HD:=nil;
			end
			else 
				if(a^.dato.cod>p.cod)then crearnodo(a^.HI,p)
				else crearnodo(a^.HD,p);
		end;
	procedure leer(var p:producto);
		begin
			writeln('cod');readln(p.cod);
			if(p.cod<>-1)then begin
				writeln('stock');readln(p.stock);
				writeln('rubro');readln(p.rubro);
				writeln('precio');readln(p.precio);
			end;
		end;
	procedure inicializar(var v:vector);
		var
			i:integer;
		begin
			for i:=1 to 10 do v[i]:=nil;
		end;
		
	var
		p:producto;
	begin
		inicializar(v);
		leer(p);
		while(p.cod<>-1)do begin
			crearnodo(v[p.rubro],p);
			leer(p);
		end;
	end;
	
procedure buscarB(v:vector);
	function recursion(a:arbol;cod:integer):boolean;
		begin
			if(a<>nil)then begin
				if(cod=a^.dato.cod)then recursion:=true
				else
					if(cod<a^.dato.cod)then recursion:=recursion(a^.HI,cod)
					else recursion:=recursion(a^.HD,cod);
			end
			else recursion:=false;
				
		end;
	var
		r:rango;
		cod:integer;
	begin
		writeln('rubro a buscar');readln(r);
		writeln('cod a buscar');readln(cod);
		if(recursion(v[r],cod))then writeln('existe')
		else writeln('no existe');
	end;
procedure punto3(v:vector;var vr:vectorR);
	procedure recursion(a:arbol;var p:puntoC);
		var
			b:arbol;
		begin
			if(a<>nil)then begin
				b:=a;
				recursion(a^.HD,p);
			end;
			p.cod:=b^.dato.cod;
			p.stock:=b^.dato.stock;
		end;
	var
		i:integer;
	begin
		for i:=1 to 10 do recursion(v[i],vr[i]);
	end;
procedure puntoD(v:vector;var va:vectoracu);
	procedure recursion(a:arbol;valor1,valor2:integer;var cont:integer);
		begin
			if(a<>nil)then begin
				if(a^.dato.cod>valor1)and(a^.dato.cod<valor2)then	begin
				 cont:=cont+1;
				 recursion(a^.HD,valor1,valor2,cont);
				 recursion(a^.HI,valor1,valor2,cont);//no se si esta bien esto
				end
				else if(a^.dato.cod<valor1)then recursion(a^.HD,valor1,valor2,cont)
					else if(a^.dato.cod>valor2)then recursion(a^.HI,valor1,valor2,cont);
			end;
		end;
	var
		valor1,valor2:integer;
		cont,i:integer;
	begin
		writeln('valor1');readln(valor1);
		writeln('valor2');readln(valor2);
		for i:=1 to 10 do begin
			cont:=0;
			recursion(v[i],valor1,valor2,cont);
			va[i]:=cont;
		end;
	end;
var
	v:vector;
	vr:vectorR;
	va:vectoracu;
BEGIN
	cargarvector(v);
	buscarB(v);
	punto3(v,vr);
	puntoD(v,va);
END.

