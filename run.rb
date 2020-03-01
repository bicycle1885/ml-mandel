JULIA = "/Applications/Julia-1.1.app/Contents/Resources/julia/bin/julia"

CMDS = [
  [ "C++ with clang", ".", "./cpp/clang/ml-mandel-clang" ],
  [ "C++ with gcc", ".", "./cpp/gcc/ml-mandel-gcc" ],
  [ "go", ".", "./go/go" ],
  [ "julia", "julia", "#{JULIA} main.jl" ],
  [ "kotlin","kotlin", "kotlin MainKt" ],
  [ "Rust", "rust/mandel", "./target/release/mandel" ],
  [ "Swift5", "swift", "./main" ],
]

CMDS.each do |name, dir,cmd|
  Dir.chdir(dir) do
    s = %x( #{cmd} > /dev/null  && (time #{cmd} 1000 9) 2>&1 )
    /real\s+(?<smin>[\d]+)m(?<ssec>[\d\.]+)s/ =~s
    sec = smin.to_i*60 + ssec.to_f
    puts( "|#{name}|#{sec}|")
  end
end
