require_relative 'Point'
require_relative 'Rectangle'
require_relative 'Triangle'
require_relative 'Circle'
require 'Pry'

class Scene
	attr_accessor :shapes
	def initialize
		@shapes = []
	end

	def add_shape(s)
		
		if (s.class ==  Rectangle || s.class == Triangle || s.class == Circle)
			@shapes << s
		else
			raise ArgumentError
		end
	end

	def remove_shape(s)
		return @shapes.delete(s)
	end

	def shape_count
		return @shapes.count
	end

	def total_area
		@shapes.reduce(0){|sum , x| sum + x.area}
	end
end

=begin
#rectangle
@r_c1 = Point.new(1.0, 2.0)
@r_c2 = Point.new(0.0, 0.0)
@r = Rectangle.new(@r_c1, @r_c2)
#triangle
@t_c1 = Point.new(0.0, 0.0)
@t_c2 = Point.new(0.0, 1.0)
@t_c3 = Point.new(2.0, 0.0)
@t = Triangle.new(@t_c1, @t_c2, @t_c3)
#circle
@p = Point.new(0.0, 0.0)
@q = 1.0
@c = Circle.new(@p, @q)

@s = Scene.new

@s.add_shape(@r)
puts @s.shapes.length.to_s
@s.add_shape(@t)
puts @s.shapes.length.to_s
@s.add_shape(@c)
puts @s.shapes.length.to_s
=end
