{
   2.	Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada película se conoce: código de película, 
		código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje 
		promedio otorgado por las críticas. Implementar un programa que contenga:
		a.	Un módulo que lea los datos de películas y los almacene ordenados por código de película y agrupados por código de género, 
			en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de película -1. 
		b.	Un módulo que reciba la estructura generada en el punto a y retorne una estructura de datos donde estén todas las películas 
			almacenadas ordenadas por código de película.

   
}


program untitled;
type
	rango=1..8;
	pelicula=record
		cod:integer;
		gen:integer;
		prom:real;
	end;
	lista=^nodo;
	nodo=record
		dato:pelicula;
		sig:lista;
	end;
	vector=array[rango]of lista;
	
	procedure agregarnodo(var l:lista;p:pelicula);
		var
			aux,act,ant:lista;
		begin
			writeln('agregarnodo');
			new(aux);
			aux^.dato:=p;
			act:=l;ant:=l;
			while(act<>nil)and(act^.dato.cod>p.cod)do begin
				ant:=act;
				act:=act^.sig;
			end;
			if(act=ant)then l:=aux
			else begin
				ant^.sig:=aux;
				aux^.sig:=act;
			end;
		end;
		
procedure cargarlista(var v:vector);
	procedure leer(var p:pelicula);
		begin
			writeln('ingrese cod');readln(p.cod);
			if(p.cod <> -1)then begin
				writeln('ingrese genero');readln(p.gen);
				writeln('ingrese puntaje promedio');readln(p.prom);
			end;
		end;
	procedure inicializar(var v:vector);
		var
			i:integer;
		begin
			writeln('inicializar');
			for i:=1 to 8 do begin
				v[i]:=nil;
				if(v[i]=nil)then writeln('v[',i,']=nil');
			end;
		end;
	var
		p:pelicula;
	begin
		inicializar(v);
		writeln('cargarlista');
		leer(p);
		while(p.cod<>-1)do begin
			agregarnodo(v[p.gen],p);
			leer(p)
		end;
	end;
	
procedure merge(v:vector;var l2:lista);
	procedure minimo(v:vector;var min:integer;var i:integer);
		var
			j:integer;
		begin
			writeln('minimo');
			min:=999;
			writeln('min: ',min);
			for j:=1 to 8 do begin
				writeln('j: ',j);
				if(v[j]<>nil)then begin
					writeln('cod: ',v[j]^.dato.cod);
					if(v[j]^.dato.cod <= min)then begin
						min:=v[j]^.dato.cod;
						writeln('min2: ',min);
						i:=j;
					end;
				end
				else writeln('vacio');
			end;
			if(min<>999)then v[i]:=v[i]^.sig;
		end;
	var
		min,i:integer;
	begin
		l2:=nil;
		min:=0;
		writeln('merge');
		minimo(v,min,i);
		while(min<>999)do begin
			writeln('min1: ',min);
			agregarnodo(l2,v[i]^.dato);
			i:=0;
			minimo(v,min,i);
			i:=0;
			writeln('min2: ',min);
		end;
	end;
procedure informar(l:lista);
	begin
		while(l<>nil)do begin
			writeln(l^.dato.cod);
		end;
	end;
var 
	l2:lista;
	v:vector;
	i:integer;
BEGIN
	cargarlista(v);
	merge(v,l2);
	for i:=1 to 8 do informar(v[i]);
	informar(l2);
END.

