{
4.- Una librería requiere el procesamiento de la información de sus productos. De cada producto se conoce el código del producto, 
	código de rubro (del 1 al 8) y precio. 
  Implementar un programa modularizado que:
	a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura de 
	   datos adecuada. El ingreso de los productos finaliza cuando se lee el precio 0.
	b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
	c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que puede haber más o menos de 30 productos 
	   del rubro 3. Si la cantidad de productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto. 
	d. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de los dos métodos vistos en la teoría. 
	e. Muestre los precios del vector ordenado.

}


program untitled;
const
	dimf=30;
type
	range=1..8;
	rangev=1..30;
	
	producto=record
		cod:integer;
		rubro:range;
		precio:real;
	end;
	lista=^nodo;
	nodo=record
		dato:producto;
		sig:lista;
	end;
	vectorl=array[range]of lista;
	vectorp=array[rangev]of producto;
	
procedure cargarvec(var v:vectorl);
	procedure leer(var p:producto);
		begin
			writeln('ingrese cod');readln(p.cod);
			if(p.cod<>0)then begin
				writeln('ingrese rubro');readln(p.rubro);
				writeln('ingrese precio');readln(p.precio);
			end;
		end;
	procedure insertarOrdenado(var l:lista;p:producto);
		var
			ant,act,aux:lista;
		begin
			new(aux);
			aux^.dato:=p;
			aux^.sig:=nil;
			act:=l;ant:=l;
			while(act<>nil)and(act^.dato.cod<aux^.dato.cod)do begin {menor a mayor, creo}
				ant:=act;
				act:=act^.sig;
			end;
			if(act=ant)then l:=aux
			else
				ant^.sig:=aux;
				aux^.sig:=act;
				
		end;
	procedure inicializarvecl(var v:vectorl);
		var i:integer;
		begin
			for i:=1 to 8 do v[i]:=nil;
		end;
var
	p:producto;
begin
	inicializarvecl(v);
	leer(p);
	while(p.cod<>0)do begin
		insertarOrdenado(v[p.rubro],p);
		leer(p);
	end;
end;

procedure recorrer(vl:vectorl);
	procedure imprimir(l:lista);
		begin
			while(l<>nil)do begin
				writeln('cod: ',l^.dato.cod,' de rubro ', l^.dato.rubro);
				l:=l^.sig;
			end;
		end;
	var
		i:integer;
	begin
		for i:=1 to 8 do begin
			imprimir(vl[i]);
		end;
	end;

procedure generarVector(var v:vectorp;vl:vectorl);
	procedure	cargarVecp(var v:vectorp;l:lista;var diml:integer);
		begin
			diml:=0;
			while (l<>nil)and(diml<=dimf)do begin
				diml:=diml+1;
				v[diml]:=l^.dato;
				l:=l^.sig;
			end;
		end;
	procedure ordenar(var v:vectorp;diml:integer);
		var
			i,j:integer;
			aux:producto;
		begin
			for i:=2 to diml do begin
				aux:=v[i];
				j:=i-1;
				while(j>0)and(v[j].precio>aux.precio)do begin
					v[j+1]:=v[j];
					j:=j-1;
				end;
				v[j+1]:=aux;
			end;
		end;
	procedure imprimirvp(v:vectorp;diml:integer);
		var
			i:integer;
		begin
			for i:=1 to diml do writeln('precios: ',v[i].precio);
		end;
	var
		diml:integer;
	begin
		cargarVecp(v,vl[3],diml);
		ordenar(v,diml);
		imprimirvp(v,diml);
	end;
var
	vl:vectorl;
	vp:vectorp;
BEGIN
	cargarvec(vl);
	recorrer(vl);
	generarVector(vp,vl);
	
END.

