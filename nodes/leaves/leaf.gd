extends BehaviorTreeNode

class_name Leaf, "../../icons/action.svg"

func _ready() -> void:
	if self.get_child_count() != 0:
		print("Error en el árbol: La hoja %s no debería tener hijos." % self.name)

# NO MODIFICAR ESTE SCRIPT. VE AL INSPECTOR -> SCRIPT -> EXTEND SCRIPT
