package main

import (
	"fmt"
	"os"
	"strconv"
)

func isMandel(rep int, lim, x, y int64) bool {
	zr := int64(0)
	zi := int64(0)
	for i := 0; i < rep; i++ {
		zrNext := zr*zr/lim - zi*zi/lim + x
		ziNext := zr*zi*2/lim + y
		dist2 := zrNext*zrNext/lim + ziNext*ziNext/lim
		if 4*lim < dist2 {
			return false
		}
		zr = zrNext
		zi = ziNext

	}
	return true
}

func countMandel(rep int, div int64) int64 {
	lim := int64(1) << div
	count := int64(0)
	for y := -lim; y <= lim; y++ {
		for x := -lim; x <= lim; x++ {
			if isMandel(rep, lim, x, y) {
				count++
			}
		}
	}
	return count
}

func parseArg(ix int, fallback int64) int64 {
	if len(os.Args) < ix+1 {
		return fallback
	}
	num, err := strconv.ParseInt(os.Args[ix], 10, 64)
	if err != nil {
		panic(err)
	}
	return num
}

func main() {
	rep := int(parseArg(1, 100))
	div := parseArg(2, 8)
	fmt.Println("rep=", rep, "  div=", div)
	fmt.Println("result=", countMandel(rep, div))
}
