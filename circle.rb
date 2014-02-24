require_relative 'Point'

class Circle
	attr_accessor :r, :p
	def initialize(p, r)
		if (p.class == Point && (r.class == Float || r.class == Fixnum))
			@p = p
			@r = r
		else
			raise ArgumentError
		end
	end

	def area
		Math::PI*(r**2)
	end
end