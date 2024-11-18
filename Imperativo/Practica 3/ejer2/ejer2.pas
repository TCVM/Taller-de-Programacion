{
   2.	Escribir un programa que:
		a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee código de producto, fecha y cantidad 
		   de unidades vendidas. La lectura finaliza con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
			i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto.
			ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol
			    debe contener el código de producto y la cantidad total vendida.
						   Nota: El módulo debe retornar los dos árboles.
				b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de unidades 
				   vendidas de ese producto.
				c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total de unidades 
				   vendidas de ese producto.

}


program untitled;
type
	venta=record
		cod,cant:integer;
		fecha:string;
	end;
	arbol=^nodo;
	nodo=record
		dato:venta;
		HI:arbol;
		HD:arbol;
	end;
	
	arbolProds=^nodo2;
	nodo2=record
		cod:integer;
		cant:integer;
		HI:arbolProds;
		HD:arbolProds;
	end;
procedure crearArbol(var a:arbol;var ap:arbolProds);
	procedure leer(var v:venta);
		begin
			writeln('ingrese cod');readln(v.cod);
			if(v.cod<>0)then begin
				writeln('ingrese fecha');readln(v.fecha);
				writeln('ingrese cantidad');readln(v.cant);
			end;
		end;
	procedure agregarnodo(var a:arbol;v:venta);
		begin
			if(a=nil)then begin
				new(a);
				a^.dato:=v;
				a^.HI:=nil;
				a^.HD:=nil;
			end
			else
				if(a^.dato.cod>v.cod)then agregarnodo(a^.HI,v)
				else agregarnodo(a^.HD,v);
		end;
	procedure agregarnodoProds(var a:arbolProds;cod,cant:integer);
		begin
			if(a=nil)then begin
				new(a);
				a^.cod:=cod;
				a^.cant:=cant;
				a^.HI:=nil;
				a^.HD:=nil;
			end
			else
				if(a^.cod>cod)then agregarnodoProds(a^.HI,cod,cant)
				else agregarnodoProds(a^.HD,cod,cant);
		end;
	procedure buscarArbolProds(var a:arbolProds;cod:integer;cant:integer);
		begin
			if(a=nil)then agregarnodoProds(a,cod,cant)
			else if(cod=a^.cod)then a^.cant:=cant+a^.cant
				else
					if(cod<a^.cod)then buscarArbolProds(a^.HI,cod,cant)
					else buscarArbolProds(a^.HD,cod,cant);
		end;
	var
		v:venta;
	begin
		leer(v);
		while(v.cod<>0)do begin
			agregarnodo(a,v);
			buscarArbolProds(ap,v.cod,v.cant);
			leer(v);
		end;
	end;
procedure buscar(a:arbol;cod:integer;var cant:integer);
	function recursion(a:arbol;cod,cant:integer):integer;
		begin
			if(a=nil)then recursion:=cant
			else begin 
					if(a^.dato.cod=cod)then begin 
						cant:=cant+a^.dato.cant;
						recursion:=recursion(a^.HD,cod,cant);
					end
					else
						if(cod<a^.dato.cod)then recursion:=recursion(a^.HI,cod,cant)
						else recursion:=recursion(a^.HD,cod,cant);
			end; 
		end;
	begin
		cant:=0;
		cant:=recursion(a,cod,cant);
	end;

procedure buscarProds(a:arbolProds;cod:integer;var cant:integer);
	function recursion(a:arbolProds;cod:integer;cant:integer):integer;
		begin
			if(a=nil)then begin 
				recursion:=cant;
				writeln(recursion);
			end
			else 
				if(cod=a^.cod)then begin
						cant:=a^.cant;
				end
				else
					if(cod<a^.cod)then recursion:=recursion(a^.HI,cod,cant)//no imprime bien
					else recursion:=recursion(a^.HD,cod,cant);
		end;
	begin
		cant:=-1;
		cant:=recursion(a,cod,cant);
	end;
var 
	a:arbol;
	ap:arbolProds;
	cod,cant:integer;
BEGIN
	crearArbol(a,ap);
	writeln('ingrese cod a buscar');readln(cod);
	buscar(a,cod,cant);
	writeln('cant1: ', cant);
	writeln('ingrese cod a buscar');readln(cod);
	buscarProds(ap,cod,cant);
	writeln('cant2: ', cant);
END.

