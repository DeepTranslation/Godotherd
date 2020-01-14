from godot import exposed, export
from godot.bindings import *
from godot.globals import *





@exposed
class PythonTest(Node2D):

	# member variables here, example:
	a = export(int)
	b = export(str, default='foo')

	def _ready(self):
		"""
		Called every time the node is added to the scene.
		Initialization here.
		"""
		
		print ('Hello World!')
		
		
	def _process(self, delta):
		globals.hello = "Hello World!"
		self.position.x = 1000
		self.position.y = 1000
		self.visibility = True 
		self.text = "Hello World!"
		
	