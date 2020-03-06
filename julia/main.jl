function isMandel(rep, lim, x, y)
  zr = 0
  zi = 0
  for i in 0:(rep-1)
    zrNext = div(zr*zr,lim) - div(zi*zi,lim) + x
    ziNext = div(zr*zi*2,lim) + y
    dist2 = div(zrNext*zrNext,lim) + div(ziNext*ziNext,lim)
    if 4*lim < dist2
      return false
    end
    zr=zrNext
    zi=ziNext
  end
  return true
end

function countMandel( rep, div )
  lim = 2^div
  count = 0
  for y in -lim:lim
    for x in -lim:lim
      if (isMandel( rep, lim, x, y))
        count+=1
      end
    end
  end
  return count
end

function main()
  rep = length(ARGS)<1 ? 100 : tryparse(Int, ARGS[1])
  div = length(ARGS)<2 ? 8 : tryparse(Int, ARGS[2])
  println( "rep=", rep, "  div=", div )
  println( "result=", countMandel(rep,div))
end

main()
