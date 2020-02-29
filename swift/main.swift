import Foundation

func isMandel(rep rep_: Int, lim lim_: Int64, x x_: Int64, y y_: Int64) -> Bool {
  var zr: Int64 = 0
  var zi: Int64 = 0
  for _ in 0 ..< rep_ {
    let zrNext:Int64 = zr*zr/lim_ - zi*zi/lim_ + x_
    let ziNext:Int64 = zr*zi*2/lim_ + y_
    let dist2:Int64 = zrNext*zrNext/lim_ + ziNext*ziNext/lim_
    if ( 4*lim_ < dist2 ){
      return false;
    }
    zr = zrNext
    zi = ziNext
  }
  return true
}

func countMandel(rep r: Int, div d: Int) -> Int64 {
  let lim = Int64(1) << d
  var count: Int64 = 0
  for y in (-lim) ... lim {
    for x in (-lim) ... lim {
      if isMandel(rep: r, lim: lim, x: x, y: y) {
        count += 1
      }
    }
  }
  return count
}

func main() {
  let argv = ProcessInfo.processInfo.arguments
  let rep = argv.count < 2 ? 100 : Int(argv[1])!
  let div = argv.count < 3 ? 8 : Int(argv[2])!
  print("rep=", rep, "  div=", div)
  print("result=", countMandel(rep: rep, div: div))
}

main()
