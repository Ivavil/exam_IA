(deffacts bh
(carga maxima 3)
(pedido naranjas 2 manzanas 3 caquis 0 uvas 1)
(robot palet naranjas 5 palet manzanas 5 palet caquis 5 palet uvas 5 linea pedido naranjas 0 manzanas 0 caquis 0 uvas 0)
)

(defrule mover_cajas
?aux <-(robot $?list0 palet $?list1 ?fruta ?num1 $?list2 linea pedido $?list3 ?fruta ?num2 $?list4)
(carga maxima ?max)
(pedido naranjas ?obj1 manzanas ?obj2 caquis ?obj3 uvas ?obj4)
(integerp ?num1)
(test(> ?num1 0))
=>
(retract ?aux)
(assert (robot $?list0 palet $?list1 ?fruta 0 $?list2 linea pedido $?list3 ?fruta ?num1 $?list4))
)

(defrule pedido_incompleto
(robot palet naranjas ?x1 palet manzanas 5 palet caquis 5 palet uvas 5 linea pedido naranjas ?num1 manzanas ?num2 caquis ?num3 uvas ?num4)
(pedido naranjas ?obj1 manzanas ?obj2 caquis ?obj3 uvas ?obj4)
(test(or(and(<> ?num1 ?obj1)(= ?num1 0))(and(<> ?num2 ?obj2)(= ?num2 0))(and(<> ?num3 ?obj3)(= ?num3 0))(and(<> ?num4 ?obj4)(= ?num4 0))))
=>
(printout t "El pedido esta incompleto" crlf)
)

(defrule meta
(declare (salience 100))
(robot $? linea pedido naranjas ?num1 manzanas ?num2 caquis ?num3 uvas ?num4)
(pedido naranjas ?obj1 manzanas ?obj2 caquis ?obj3 uvas ?obj4)
(test(and(= ?num1 ?obj1)(= ?num2 ?obj2)(= ?num3 ?obj3)(= ?num4 ?obj4)))
=>
(halt)
(printout t "Se ha entregado el pedido" crlf)
)