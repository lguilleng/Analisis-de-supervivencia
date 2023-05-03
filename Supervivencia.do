
* abrimos el archivo de datos
use datos_supervivencia, clear

/* Setemos los datos
   Debemos comprobar que la variable que identifica el evento esté codificada
   como 1=evento y 0 en otro caso */

stset tiempo, failure(fallecer=1) id(id)

/* Incidencia */

stptime /* el comando requiere un id de persona */
stptime, per(1000) /* incidencia por 1000 personas */



   
/* Estimación de la supervivencia con tablas de vida

stset tiempo, failure(fallecer=1)

ltable tiempo fallecer
ltable tiempo fallecer, by(transplante)
ltable tiempo fallecer, by(transplante) interval(365)
ltable tiempo fallecer, by(transplante) graph

/* Estimación de la supervivencia con Kaplan Meier

sts list
sts list, by(transplante)


* Comparamos curvas de supervivencia con K-M

sts graph
sts graph, by(transplante)
sts graph, by(transplante) gw
sts graph, by(transplante) cens(s) /* muestra las censuras */
sts graph, by(transplante) cens(number) /* muestra el # de censuras */
sts test transplante /* comparación analítica */

* Curva de incidencia

sts graph, by(transplante) failure

* Regresión de Cox

stcox transplante, hr /* sin variables explicativas
                         la opción hr para que muestre 
						 la matriz de Hazart (riesgo)
						 aunque hr es por defecto */

stcox transplante edad cirugia tespera, hr /* con variables explicativas (confusoras) */

* Evaluación de supuestos para regresión Cox

stphplot, by(transplante)
stcoxkm, by(transplante)
stcurve, hazard at1(transplante=0) at2(transplante=1)
stphtest /* prueba estadistica */
