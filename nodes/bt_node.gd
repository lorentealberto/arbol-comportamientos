extends BehaviorTree

class_name BehaviorTreeNode, "../icons/action.svg"

""" Clase base para todos los nodos que componen el árbol. """

enum { SUCCESS, FAILURE, RUNNING }

""" TICK (Base / No definida)
Descripción:
	Actualiza el nodo una vez por frame.
Parámetros:
	actor: (CUALQUIERA): Objeto padre al que se la ha asignado la IA.
	blackboard: Blackboard: BBDD del árbol.
Devuelve:
	-> Nada."""
func tick(actor, blackboard: Blackboard) -> int:
	return -1
