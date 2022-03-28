;ejemplo
(deffacts
(carga maxima 3)
(pedido naranjas 2 manzanas 3 caquis 0 uvas 1)
(robot palet naranjas 5 palet manzanas 5 palet caquis 5 palet uvas 5 linea pedido naranjas 0 manzanas 0 caquis 0 uvas 0)
)

(defrule mover_cajas
(robot palet $? ?fruta ?num $?)
(carga maxima ?max)
(pedido naranjas ?obj1 manzanas ?obj2 caquis ?obj3 uvas ?obj4)
=>



(defrule pedido_incompleto
(robot $? linea pedido naranjas ?num1 manzanas ?num2 caquis ?num3 uvas ?num4)
(pedido naranjas ?obj1 manzanas ?obj2 caquis ?obj3 uvas ?obj4)
(test(and(<> ?num1 obj1)(= ?num1 0)))
(test(and(<> ?num2 obj2)(= ?num2 0)))
(test(and(<> ?num3 obj3)(= ?num3 0)))
(test(and(<> ?num4 obj4)(= ?num3 0)))
=>
(printout t "El pedido esta imcompleto" crlf)
)

(defrule meta
(declare (salience 100))
(robot $? linea pedido naranjas ?num1 manzanas ?num2 caquis ?num3 uvas ?num4)
(pedido naranjas ?obj1 manzanas ?obj2 caquis ?obj3 uvas ?obj4)
(test(and(= ?num1 obj1)(= ?num2 obj2)(= ?num3 obj3)(= ?num4 obj4)))
=>
(halt)
(printout t "Se ha entregado el pedido" crlf)
)