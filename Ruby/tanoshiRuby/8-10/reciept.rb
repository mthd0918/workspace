class Receipt
    def initialize(name)
        @name = name # インスタンス変数の初期化
        @lines = []
    end

    def lines=(lines)
        @lines = lines
    end

    # メソッドの定義

    def calc
        total = 0
        @lines.each do |line| 
            total += line[:price] * line[:num]
        end
        total
    end

    def output
        puts "レシート #{@name}" #インスタンス変数 ⇒ メソッドが変わっても値を保持する
        @lines.each do |line|
            puts "#{line[:name]} #{line[:price]}円 x #{line[:num]}"
        end
        puts "合計金額: #{calc}円"
    end
end

r1 = Receipt.new("ストアA") # 
r1.lines = [{name: "卵", price: 200, num: 1},
        {name: "大根", price: 100, num: 2}]
r1.output