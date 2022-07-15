class Point
    attr_accessor :x, :y

    def initialize(x=0, y=0)
        @x, @y = x, y
    end

    def inspect # pメソッドで「(x,y)」と表示する
        "(#{x}, #{y})"
    end

    def +(other) # x,yのそれぞれを足す
        self.class.new(x + other.x, y + other.y)
    end

    def -(other)
        self.class.new(x - other.x, y - other.y)
    end
end

point0 = Point.new(3, 6)
point1 = Point.new(1, 8)

p point0
p point1
p point0 + point1
p point0 - point1