from godot import exposed, export
from pythonscriptcffi import lib, ffi
from godot.bindings import *
from godot.globals import *

import numpy
#import sklearn
from sklearn.neural_network import MLPRegressor
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import make_pipeline



# DEFAULT_SPEED = 220


@exposed
class Evolution(Object):
	
	# member variables here, example:
	#a = export(int)
	#b = export(str, default='foo')
    
		
	def move(self, angle_to_target, distance_to_target,value):
		#print ("done")
		number_hidden_layers = 5
		number_output_values = 2 # move_angle and move_speed
		#create input array for Multilayer Perceptron
		X_array = numpy.zeros(2)
		
		X_array[0]=angle_to_target
		X_array[1]=distance_to_target
		#mlp = make_pipeline(StandardScaler(),
        #            MLPRegressor(hidden_layer_sizes=(number_hidden_layers, number_output_values),
        #                         tol=1e-2, max_iter=10, random_state=0))
							
		#‘lbfgs’ is an optimizer in the family of quasi-Newton methods.
		
		#The attribute coefs_ contains a list of weight matrices for every layer. 
		#The weight matrix at index i holds the weights between the layer i and layer i + 1.
		#mlp.coefs_[0] = np.random.rand(number_hidden_layers,number_output_values)
		#mlp.coefs_[1] = np.random.rand(number_output_values,number_hidden_layers)
		y_array = np.random.rand(2)
		#y_array= mlp.predict(X_array)
		
		value[0]=y_array[0] #angle
		value[1]=y_array[1] #speed
		
		#return value
		#the return values are stored directly in the godot array
