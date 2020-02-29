fun isMandel(rep: Int, lim: Long, x: Long, y: Long): Boolean {
    var zr = 0L
    var zi = 0L
    for (i in 0 until rep) {
        val zrNext = zr * zr / lim - zi * zi / lim + x
        val ziNext = zr * zi * 2 / lim + y
        val dist2 = zrNext * zrNext / lim + ziNext * ziNext / lim
        if (4 * lim < dist2) {
            return false
        }
        zr = zrNext
        zi = ziNext
    }
    return true
}

fun countMandel(rep: Int, div: Int): Long {
    val lim = 1L.shl(div)
    var count = 0L
    for (y in (-lim)..lim) {
        for (x in (-lim)..lim) {
            if (isMandel(rep, lim, x, y)) {
                count++
            }
        }
    }
    return count
}

fun main(args: Array<String>) {
    val rep = if (args.size <1) 100 else args[0].toInt(10)
    val div = if (args.size <2) 8 else args[1].toInt(10)
    println("rep=$rep  div=$div")
    println("result=${countMandel(rep, div)}")
}
