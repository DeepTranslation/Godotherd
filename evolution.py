from godot import exposed, export
from pythonscriptcffi import lib, ffi
from godot.bindings import *
from godot.globals import *

import numpy
import sklearn

# DEFAULT_SPEED = 220


@exposed
class Evolution(Object):
	
	# member variables here, example:
	#a = export(int)
	#b = export(str, default='foo')
    
		
	def move(self, angle_to_target, distance_to_target,value):
		#print ("done")
		my_array = numpy.zeros(2)
		
		
		value[0]=1
		value[1]=2
		
		##########return value
		##########the return values are stored directly in the godot array
