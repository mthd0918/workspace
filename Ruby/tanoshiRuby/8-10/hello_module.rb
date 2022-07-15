module HelloModule              # module文
    VERSION = "1.0"             # 定数の定義

    def hello(name)
        "Hello, #{name}"        #メソッドの定義
        puts "Hello, #{name}."
    end
    module_function :hello      # helloをモジュール関数として公開する
end

p HelloModule::VERSION
HelloModule.hello("Alice")
include HelloModule
p VERSION
hello("Alice")