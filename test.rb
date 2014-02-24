require 'minitest/spec'
require 'minitest/autorun'
require 'Pry'
require_relative 'Point'
require_relative 'Rectangle'
require_relative 'Triangle'
require_relative 'Circle'
require_relative 'Scene'

describe Point do 
	it "can be initialized" do
		Point.new(1.0, 1.0).wont_be_nil
	end

end

describe Rectangle do 
	before do
		@c1 = Point.new(1.0, 2.0)
		@c2 = Point.new(0.0, 0.0)
		@r = Rectangle.new(@c1, @c2)
	end

	it "can be initialized" do
		Rectangle.new(@c1, @c2).wont_be_nil
	end

	it "will error" do
		proc{ Rectangle.new(5, @c2) }.must_raise ArgumentError
	end

	it "area correct" do
		@r.area.must_equal 2
	end

end

describe Triangle do 
	before do
		@c1 = Point.new(0.0, 0.0)
		@c2 = Point.new(0.0, 1.0)
		@c3 = Point.new(2.0, 0.0)
		@t = Triangle.new(@c1, @c2, @c3)
	end

	it "can be initialized" do
		Triangle.new(@c1, @c2, @c3).wont_be_nil
	end

	it "will error" do
		proc{Triangle.new(5, @c2, @c3)}.must_raise ArgumentError
	end

	it "area correct" do

		puts @t.area.to_s
		@t.area.must_equal 1
	end

end

#binding.pry

describe Circle do 
	before do
		#binding.pry
		@c1 = Point.new(0.0, 0.0)
		@r = 1.0
		@c = Circle.new(@c1, @r)
	end

	it "can be initialized" do
		Circle.new(@c1, @r).wont_be_nil
	end

	it "will error" do
		proc{ Circle.new(5, @r) }.must_raise ArgumentError
	end

	it "area correct" do
		@c.area.must_equal Math::PI
	end

end

describe Scene do 
	before do
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

	end

	it "can be initialized" do
		Scene.new.wont_be_nil
	end

	it "can add a shape" do
		@s.add_shape(@r)
		@s.shapes.length.must_equal 1
		@s.add_shape(@t)
		@s.shapes.length.must_equal 2
		@s.add_shape(@c)
		@s.shapes.length.must_equal 3
		binding.pry
	end

	it "add_shape will error" do
		proc{ @s.add_shape("grr") }.must_raise ArgumentError
	end
	
	it "can remove a shape" do
		@s.add_shape(@r)
		@s.add_shape(@t)
		@s.add_shape(@c)

		@s.remove_shape(@c)
		@s.shapes.length.must_equal 2
	end

	it "area correct" do
		@s.add_shape(@r)
		@s.add_shape(@t)
		#area of r = 2 area of t = 1
		@s.total_area.must_equal 3
	end

end