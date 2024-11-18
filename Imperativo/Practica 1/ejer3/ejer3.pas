{
   3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022. De cada película se conoce: 
    código de película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) 
    y puntaje promedio otorgado por las críticas. 
	Implementar un programa modularizado que:
	a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, en una estructura de datos adecuada.
	   La lectura finaliza cuando se lee el código de la película -1. 
	b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código de película con mayor puntaje obtenido 
	   entre todas las críticas.
	c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría. 
	d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película con menor puntaje.

}


program untitled;
type
	range=1..8;
	pelicula=record
		codp:integer;
		codg:range;
		p:real;
	end;
	
	vector=array[range]of pelicula;
	
	lista=^nodo;
	nodo=record
		dato:pelicula;
		sig:lista;
	end;
	
	listaR=record
		l:lista;
		ult:lista;
	end;
	vectorLista=array[range]of listaR; 

procedure cargar(var v:vectorLista);
	procedure leer(var p:pelicula);
		begin
			writeln('ingrese cod');readln(p.codp);
			if(p.codp <> -1)then begin
				writeln('ingrese genero');readln(p.codg);
				writeln('ingrese puntaje');readln(p.p);
			end;
		end;
	procedure agregaratras(var l,ult:lista;p:pelicula);
		var
			aux:lista;
		begin
			new(aux);
			aux^.dato:=p;
			aux^.sig:=nil;
			if(l=nil)then l:=aux
			else
				ult^.sig:=aux;
			ult:=aux;
		end;
	procedure inicializarveclista(var v:vectorLista);
		var
			i:integer;
		begin
			for i:=1 to 8 do begin 
				v[i].l:=nil;
				v[i].ult:=nil;
			end;
		end;

var
	p:pelicula;
begin
	inicializarveclista(v);
	leer(p);
	while(p.codp<>-1)do begin
		agregaratras(v[p.codg].l,v[p.codg].ult,p);
		leer(p);
	end;
end;

procedure recorrer(vl:vectorLista;var v:vector);
	procedure inicializarvec(var v:vector);
		var
			i:integer;
		begin
			for i:=1 to 8 do begin
				v[i].codp:=0;
				v[i].p:=0;
			end;
		end;
	procedure mayorpuntaje(l:lista;var v:pelicula);
		begin
			while(l<>nil)do begin
				if(l^.dato.p > v.p)then begin
					v:=l^.dato;
				end;
				l:=l^.sig;
			end;
		end;
	procedure ordenar(var v:vector;diml:integer);
		var
			i,j,p:integer;
			aux:pelicula;
		begin
			for i:=1 to diml-1 do begin
				p:=i;
				for j:=i+1 to diml do if(v[p].p<v[j].p)then p:=j;{de mayor a menor}
				aux:=v[p];
				v[p]:=v[i];
				v[i]:=aux;{ceros quedan al final del vector}
			end;
		end;
	procedure imprimir(v:vector;diml:integer);
		begin
			writeln('mayor elemento: ',v[1].codp);
			writeln('menor elemento: ',v[diml].codp);
		end;
var
	i,diml:integer;
begin
	inicializarvec(v);
	diml:=0;
	for i:=1 to 8 do begin
		mayorpuntaje(vl[i].l,v[i]);
		if(v[i].p<>0)then diml:=diml+1;
	end;
	ordenar(v,diml);
	imprimir(v,diml);
end;
var
	v:vector;
	vl:vectorLista;
BEGIN
	cargar(vl);
	recorrer(vl,v);
END.

