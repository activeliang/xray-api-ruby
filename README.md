### Xray-Core基于Grpc API在Ruby上的实现

使用方法: 

> 直接看example.rb内的示例。

如何基于ruby实现的（Mac端）：

- 克隆项目[xray-core](https://github.com/XTLS/Xray-core)到本地
- 准备依赖：
    - brew install protobuf
    - gem install google-protobuf
    - gem install grpc grpc-tools
- 将项目中的.proto文件转换成ruby适合的文件
  - 在项目根目录新建proto文件夹：`$ mkdir -p proto`
  - 执行以下代码转换文件：
    ```
    def proto2pb(path)
      # 获取当前目录所有文件和文件夹的路径
      files = Dir.glob("#{path}/*")
      # 遍历所有文件
      files.each do |file|
        if File.file?(file) && File.extname(file) == ".proto"
          # 如果是.proto文件，转换为ruby适合的pb文件
          `grpc_tools_ruby_protoc --ruby_out=proto --proto_path=./ --grpc_out=proto #{file.sub(Dir.pwd, '')}`
        elsif File.directory?(file)
          # 如果是文件夹，则递归调用函数
          proto2pb(file)
        end
      end
    end
    proto2pb "/Users/liang/work/test/Xray-core" #这里的路径请改成你本地的项目根路径
    ```
    这样就已经拿到了ruby可用的pb文件了 都在proto目录下
  - 修改require_relative的引用问题，执行以下代码：
    ```
    def solve_relative(path)
      # 获取当前目录所有文件和文件夹的路径
      files = Dir.glob("#{path}/*")
      # 遍历所有文件
      files.each do |file|
        if File.file?(file) && file.include?("_pb.rb")
          # 如果是.pb文件，检查并处理
          File.write(file, File.read(file).gsub(/require '(.+?)_pb'/, "require_relative Dir.pwd + '/' + '\\1_pb'"))
        elsif File.directory?(file)
          # 如果是文件夹，则递归调用函数
          solve_relative(file)
        end
      end
    end
    solve_relative "/Users/liang/work/test/Xray-core/proto" #这里的路径请改成你本地的项目根路径
    ```
这样就已经得到完全可以用的ruby版本的代码了。接下来就可以按example.rb中的方式调用了。