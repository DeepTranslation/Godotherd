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
	start = export(bool, default=True)
	
	def _ready(self):
		self.start = True
		
	def scaler(value, min, max):
		scaled_value = (value - min) / (max - min)
		return scaled_value
		
	def de_scaler(scaled_value, min, max):
		value = (scaled_value * (max - min)) + min
		return value
		
	def move(self, angle_to_target, distance_to_target,value):
		#print ("done")
		if self.start:
			 
			number_hidden_layers = 5
			number_output_values = 2 # move_angle + move_speed
			
			#create input array for Multilayer Perceptron
			X_array = numpy.zeros((1,2))
			
			X_array[0,0]=angle_to_target
			X_array[0,1]=distance_to_target
			
			# scaling input values
			# scaling angles from radians between 0 and 2pi to between 0 and 1
			X_array[0,0]=scaler(X_array[0,0],0,2*numpy.pi)
			# scaling speed from between 0 and 100 to between 0 and 1
			X_array[0,1]=scaler(X_array[0,1],0,100)
			
			#create output array for initial fit
			y_array = numpy.zeros((1,2))
			y_array[0,0]=angle_to_target
			y_array[0,1]=55
			mlp = MLPRegressor(hidden_layer_sizes=(number_hidden_layers, number_output_values),solver='lbfgs',
		                             tol=1e-2, max_iter=10, random_state=0)

			#‘lbfgs’ is an optimizer in the family of quasi-Newton methods.
			mlp.fit(X_array,y_array)
			#The attribute coefs_ contains a list of weight matrices for every layer. 
			#print(len(mlp.coefs_[0]))
			#print(numpy.size(mlp.coefs_[0]))
			#print(len(mlp.coefs_[1]))
			#print(numpy.size(mlp.coefs_[1]))


			#The weight matrix at index i holds the weights between the layer i and layer i + 1.
			#mlp.coefs_[0] = numpy.random.rand(number_hidden_layers,number_output_values)
			#mlp.coefs_[1] = numpy.random.rand(number_output_values,number_hidden_layers)
			#y_array = numpy.random.rand(2)
		y_array2= mlp.predict(X_array)
		#rescaling output values
		y_array2[0,0]=de_scaler(y_array2[0,0],0,2*numpy.pi)
	
		y_array2[0,1]=de_scaler(y_array2[0,1],0,100)
			
		value[0]=y_array2[0,0] #angle
		value[1]=y_array2[0,1] #speed
		
		#return value
		#the return values are stored directly in the godot array
