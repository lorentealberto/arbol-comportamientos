extends Reference
class_name Blackboard
""" 
Ésta es la base de datos donde van todas tus variables. Aquí se guardarán todos
todos los datos que desees. Desde la posición del jugador, para saber si está
cerca del enemigo, la vida del propio enemigo, etc...

Aquí simplemente tienes que guardar la información, posteriormente la podrás
utilizar para comprobar si se cumple alguna condición o si quieres hacer algo
con ella.

Ésta es una muy buena forma de separar los datos de los comportamiento, que
utilizan dichos datos. De este modo, nos ahorraremos una gran cantidad de bugs. """

var blackboard: Dictionary = {}

""" SET (Público)
Descripción:
	Actualiza o añade una entrada a la base de datos (Blackboard) con la
	llave y el valor introducidos.
Parámetros:
	-> key: String: Llave (Nombre) de los datos que se añadirán a la base de datos.
	-> value: (CUALQUIERA): Contiene los datos que se añadirán a la base de datos junto al nombre
	-> blackboard_name: String: Nombre de la base de datos donde se quiere introducir la
		anterior.
Devuelve:
	-> Nada."""
func set(key: String, value, blackboard_name: String = 'default') -> void:
	if not blackboard.has(blackboard_name):
		blackboard[blackboard_name] = {}

	blackboard[blackboard_name][key] = value

""" GET (Público)
Descripción:
	Obtiene los datos correspondientes a la llave introducida.
Parámetros:
	-> key: String: Nombre de la llave de la que se quieren obtener los datos.
	-> default_value: (CUALQUIERA): En caso de que la llave introducida no tenga ningún valor
		se devolverá el valor por defecto.
	-> blackboard_name: String: Nombre de la base de datos de la cual queremos extraer
		los datos.
Devuelve:
	-> El valor de la llave."""
func get(key: String, default_value = null, blackboard_name: String = 'default'):
	if has(key, blackboard_name):
		return blackboard[blackboard_name].get(key, default_value)
	return default_value

""" HAS (Público)
Descripción:
	Comprueba si existe, en la base de datos indicada, alguna entrada
	con la llave introducida.
Parámetros:
	-> key: String: Llave de la cual se quiere comprobar si existe algún registro.
	-> blackboard_name: String: Nombre de la base de datos donde se quiere buscar la llave.
Devuelve:
	-> True: Si se ha encontrado algún registro.
	-> False: Si no se ha encontrado ningún registro."""
func has(key: String, blackboard_name: String = 'default') -> bool:
	return blackboard.has(blackboard_name) and blackboard[blackboard_name].has(key) and blackboard[blackboard_name][key] != null

""" ERASE (Público)
Descripción:
	Borra de la BBDD los datos asociados a la llave indicada.
Parámetros:
	-> key: String: Llave de la cual se quieren borrar los datos.
	-> blackboard_name: String: Base de datos (BBDD) de la cual se quiere borrar la
		información.
Devuelve:
	-> Nada. """
func erase(key: String, blackboard_name: String = 'default') -> void:
	if blackboard.has(blackboard_name):
		 blackboard[blackboard_name][key] = null
