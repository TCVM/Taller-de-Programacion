program untitled;
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;
	
procedure agregarAdelante(var l:lista;num:integer);
	var
		aux:lista;
	begin
		new(aux);
		aux^.dato:=num;
		aux^.sig:=l;
		l:=aux;
	end;

procedure agregarAtras(var l,ult:lista;num:integer);
	var
		aux:lista;
	begin
		new(aux);
		aux^.dato:=num;
		aux^.sig:=nil;
		if(l=nil)then l:=aux
		else
			ult^.sig:=aux;
		ult:=aux;
	end;
	
function buscar(l:lista;valor:integer):boolean;
	var
		aux:lista;
		encontre:boolean;
	begin
		aux:=l;
		encontre:=false;
		while(aux<>nil)and(encontre=false)do begin
			if(aux^.dato=valor)then encontre:=true
			else
				aux:=aux^.sig;
		end;
		buscar:=encontre;
	end;

function buscar-organizado(l:lista;valor:integer):boolean;
	var
		aux:lista;
		encontre:boolean;
	begin
		aux:=l;
		encontre:=false;
		while(aux<>nil)and(aux^.dato<valor)do begin
			aux:=aux^.sig;
		end;
		if(aux<>nil)and(aux^.dato=valor)then encontre:=true;
		buscar-organizado:=encontre;
	end;

procedure insertarOrdenado(var l:lista;d:dato);
	var
		nue,act,ant:lista;		
	begin
		ant:=l;act:=l;
		new(aux);
		aux^.dato:=d;
		while(act<>nil)and(act^.dato<d.dato)do begin
			ant:=act;
			act:=ac^.sig;
		end;
		if(act=ant)then l:=aux
		else ant^.sig:=aux;
		aux^.sig:=act;
	end;
	
procedure eliminar(var l:lista;valor:integer);
	var
		act,ant:lista;
	begin
		act:=l;ant:=l;
		while(act<>nil)and(act^.dato<>valor)do begin //si es ordenada usar (act^.dato(< o >)valor)
			ant:=act;
			act:=act^.sig
		end; 
		if(act<>nil)then
			if(act=l)then begin
				l:=l^.sig;
				dispose(act);
			end
			else begin 
				ant^.sig:=act^.sig;
				dispose(act);
			end;
	end;

procedure eliminar-conrepetidos(var l:lista;valor:integer);
	var
		act,ant:lista;
	begin
		act:=l;
		while(act<>nil)do begin //while en el if si la lista ordenada con un bool en este que corte cuando valor es (< o >) que el valor de los nodos
			if(act^.dato<>valor)then 
				ant:=act;act:=act^.sig
			else begin
				if(l=act)then l:=l^.sig
				else
					ant^.sig:=act^.sig;
				dispose(act);
				act:=ant;
			end;
		end;
	end;

procedure eliminarGrupo(var v:vector;var diml:integer;valorI,valorS:integer);
	var
		i,posI,posS,cont,cant:integer
	begin
		i:=1;
		while(i<diml)and (v[i]< valorI)do begin
			i:=i+1;
		end;
		posI:=i;
		while(i<diml)and(v[i]<valorS)do begin
			i:=i+1;
		end;
		posS:=i;
		cont:=0;
		for i:=posS + 1 to diml do begin
			v[posI + cont]:=v[i];
			cont:=cont+1;diml-1;
		end;
	end;
	
procedure eliminarGrupo(var v:vec;var diml:integer;posI,posS:integer);
	var
		i,j,dif:integer;
	begin
		j:=0;
		if(posI>=1)and(posS<=diml)then begin
			dif:=posS-posI;
			for i:=posS+1 to diml do begin
				v[posI+j]:=v[i];
				j:=j+1;
			end;
			diml:=diml-dif-1;
		end;
	end;

var i : byte;

BEGIN
	
	
END.

