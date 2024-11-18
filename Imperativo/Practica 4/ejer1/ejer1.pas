{
 1.	 Una biblioteca nos ha encargado procesar la información de los préstamos realizados durante cada el año 2021. De cada préstamo se 
     conoce el ISBN del libro, el número de socio, día y mes del préstamo y cantidad de días prestados. Implementar un programa con:
		a.	Un módulo que lea préstamos y retorne en una estructura adecuada la información de los préstamos organizada por mes. Para cada 
		    mes, los préstamos deben quedar ordenados por ISBN. La lectura de los préstamos finaliza con ISBN -1.
		b.	Un módulo recursivo que reciba la estructura generada en a. y muestre, para cada mes, ISBN y numero de socio.
		c.	Un módulo que reciba la estructura generada en a. y retorne una nueva estructura con todos los préstamos ordenados por ISBN.
		d.	Un módulo recursivo que reciba la estructura generada en c. y muestre todos los ISBN y número de socio correspondiente.
		e.	Un módulo que reciba la estructura generada en a. y retorne una nueva estructura ordenada ISBN, donde cada ISBN aparezca una 
		    vez junto a la cantidad total de veces que se prestó durante el año 2021.
		f.	Un módulo recursivo que reciba la estructura generada en e. y muestre su contenido.
}


program untitled;
type
	rango=1..12;
	prestamo=record
		mes:rango;
		ISBN,num,dia,cant:integer;
	end;
	lista=^nodo;
	nodo=record
		dato:prestamo;
		sig:lista;
	end;
	lista2=^nodo2;
	nodo2=record
		ISBN:integer;
		cant:integer;
		sig:lista2;
	end;
	vector=array[rango]of lista;
	
procedure cargarlista(var v:vector;var todo:lista;var lcorte:lista2);
	procedure leer(var p:prestamo);
		begin
			writeln('ingrese ISBN');readln(p.ISBN);
			if(p.ISBN<>0)then begin
				writeln('Ingrese num');readln(p.num);
				writeln('Ingrese dia');readln(p.dia);
				writeln('Ingrese mes');readln(p.mes);
				writeln('ingrese cant');readln(p.cant);
			end;
		end;
	procedure agregarnodo(var l:lista;p:prestamo);
		var
			aux,ant,act:lista;
		begin
			new(aux);
			aux^.dato:=p;
			act:=l;ant:=l;
			while(act<>nil)and(act^.dato.ISBN<p.ISBN)do begin
				ant:=act;
				act:=act^.sig;
			end;
			if(act=ant)then L:=aux
			else
				ant^.sig:=aux;
				aux^.sig:=act;
		end;
	procedure inicializar(var v:vector);
		var
			i:integer;
		begin
			for i:=1 to 12 do v[i]:=nil;
		end;

	
	procedure minimo(v:vector;var min:integer;var p:prestamo);
	var
		i,indicemin:integer;
	begin
		min:=999;
		for i:=1 to 12 do
			if(v[i]<>nil)then 
				if(v[i]^.dato.ISBN<=999)then begin
					indicemin:=i;
					min:=v[i]^.dato.ISBN;
				end;
		if(min<>999)then begin
			p:=v[indicemin]^.dato;
			v[indicemin]:=v[indicemin]^.sig;
		end;
	end;
	procedure merge(v:vector;var todo:lista);
	var
		p:prestamo;
		min:integer;
	begin
		todo:=nil;
		minimo(v,min,p);
		while(min<>999)do begin
			agregarnodo(todo,p);
			minimo(v,min,p);
		end;
	end;
	procedure agregarnodo2(var l:lista2;ISBN,cant:integer);
		var
			aux,ant,act:lista2;
		begin
			new(aux);
			aux^.ISBN:=ISBN;
			aux^.cant:=cant;
			act:=l;ant:=l;
			while(act<>nil)and(act^.ISBN<ISBN)do begin
				ant:=act;
				act:=act^.sig;
			end;
			if(act=ant)then L:=aux
			else
				ant^.sig:=aux;
				aux^.sig:=act;
		end;
	procedure mergeCorteControl(v:vector;var lcorte:lista2);
		var
			p:prestamo;
			min,cant,actual:integer;
		begin
			lcorte:=nil;
			minimo(v,min,p);
			while(min<>999)do begin
				cant:=0;
				actual:=p.ISBN;
				while(min<>999)and(actual=p.ISBN)do begin
					cant:=1+cant;
					minimo(v,min,p);
				end;
					agregarnodo2(lcorte,actual,cant);
			end;
		end;
	var
		p:prestamo;
	begin
		todo:=nil;
		inicializar(v);
		leer(p);
		while(p.ISBN<>-1)do begin
			agregarnodo(v[p.mes],p);
			leer(p);
		end;
		merge(v,todo);
		mergeCorteControl(v,lcorte);
	end;

procedure b(v:vector;var i:integer);
	begin
		if(i<=12)then begin
			if(v[i]<>nil)then begin
				writeln('ISBN: ',v[i]^.dato.ISBN);
				writeln('socio: ',v[i]^.dato.num);
				b(v,i);
			end
			else
				i:=i+1;
		end;
	end;
	
procedure d(l:lista);
	begin
		if(l<>nil)then begin
			writeln('ISBN',l^.dato.ISBN);
			writeln('num',l^.dato.num);
			d(l^.sig);
		end;
	end;
procedure e(l:lista2);
	begin
		if(l<>nil)then begin
			writeln('ISBN',l^.ISBN);
			writeln('cant',l^.cant);
			e(l^.sig);
		end;
	end;
var 
	i:integer;
	todos:lista;
	lcorte:lista2;
	v:vector;
BEGIN
	i:=1;
	cargarlista(v,todos,lcorte);
	b(v,i);
	d(todos);
	e(lcorte);
END.

