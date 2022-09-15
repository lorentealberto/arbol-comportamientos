extends BehaviorTree

class_name BehaviorTreeRoot, "../icons/tree.svg"

""" Raíz del árbol. Se encarga de ejecutar los procesos básicos para el correcto
	funcionamiento del árbol. """

const Blackboard = preload("../blackboard.gd")

export (bool) var enabled: bool = true

onready var blackboard: Blackboard = Blackboard.new()

""" _READY (Nativa / Automática)
Descripción:
	Función que se ejecutará una única vez cuando el componente esté disponible.
Parámetros:
	-> Ninguno.
Devuelve:
	-> Nada."""
func _ready() -> void:
	if self.get_child_count() != 1:
		print("Behavior Tree error: Root should have one child")
		disable()
		return

""" _PHYSICS_PROCESS (Nativa / Automática)
Descripción:
	Si el árbol está activado lo procesa compartiendo los datos de la BBDD con
	todas las ramas. En caso contrario, el árbol no se procesa.
Parámetros:
	-> delta: float: Milisegundos que han trascurrido desde que se invocó este
		método por última vez.
Devuelve:
	-> Nada."""
func _physics_process(delta: float) -> void:
	if not enabled:
		return

	blackboard.set("delta", delta)

	self.get_child(0).tick(get_parent(), blackboard)

""" ENABLE (Público)
Descripción:
	Activa el árbol.
Parámetros:
	-> Ninguno.
Devuelve:
	-> Nada. """
func enable() -> void:
	self.enabled = true

""" DISABLE (Público)
Descripción:
	Desactiva el árbol.
Parámetros:
	-> Ninguno.
Devuelve:
	-> Nada. """
func disable() -> void:
	self.enabled = false
