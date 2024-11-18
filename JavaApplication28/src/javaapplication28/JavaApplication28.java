/*
    Representar funciones de teatro. Una funcion tiene titulo, fecha, hora y mantiene una estructura 
    que representa la sala (N filas y M butacas por fila) que almacenara la informacion de cada butaca,
    que comprende un descriptor(string), el precio y su estado(si esta ocupada o no)

    1- Genere las clases necesarias. Provea los constructores necesarios. La funcion debe inciarse a 
       partir de un titulo, una fecha, una hora y las dimensiones de la sala (N y M).  Inicialmente
       cada butaca debe estar desocupada, tener precio que surge de la formula 800+100*nro_fila_de_
       la_butaca y un descriptor "Butaca i,j" donde i es el nro. de fila y j es el nro. de butaca
       dentro de su fila.

    2- Implemente los metodos necesarios en las clases que corresponda para:
        
        a) Ocupar la butaca numero B de la fila numero F y retornar su precio. Asuma que F y B estan en
           rango 1..N y 1..M respectivamente.
         
        b) Desocupar todas las butacas de la fila numero F de la funcion. Asuma que F esta en rango 1..N.

        c) Obtener un string con todas las representaciones de las butacas numero B de la funcion. La
           representacion de cada butaca es del estilo ("descriptor, precio, estado").

        d) Obtener un string que represente la funcion, que contenga: titulo, fecha, hora y la represen-
           tacion de cada butaca("descritor, precio, estado")

    3- Realice un programa que instacie una funcion de teatro. Ocupe distintas butacas. Compruebe el
       correcto funcionamiento de los metodos implementados.
*/

package javaapplication28;
import PaqueteLectura.Lector;

public class JavaApplication28 {

    
    public static void main(String[] args) {
    int hora=2;
	int n=5;
	int m=5;
	String titulo="a";
	String fecha="a";
	
	Funcion f=new Funcion("a", fecha, hora, n, m);

	f.ocuparButaca(2,4);
	f.ocuparButaca(3,2);
	f.desocuparFila(2);
	
    System.out.println(f.representacionButacasPorNumero(2));
	System.out.println(	f.representacionButacasPorNumeropart2());
    }

	
}
