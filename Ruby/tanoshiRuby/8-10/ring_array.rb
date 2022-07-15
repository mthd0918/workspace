class RingArray < Array     # スーパークラスを再定義する
    def [] (i)              # 演算子[]の再定義
        idx = i % size      # 新しいいインデックスを求める
        super(idx)          # スーパークラスの同名のメソッドを呼ぶ
    end
end

wday =RingArray["日","月","火","水","木","金","土"]
p wday[6]
p wday[11]
p wday[15]
p wday[-1]