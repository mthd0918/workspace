module M
    def meth
        "M#neth"
    end
end

class C
    prepend M # 継承順序でモジュールMをクラスCの手前に追加する

    def meth
        "C#meth"
    end
end

c = C.new
p C.ancestors
p c.meth