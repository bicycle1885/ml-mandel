use std::env;

fn is_mandel(rep: i32, lim: i64, x: i64, y: i64) -> bool {
    let mut zr: i64 = 0;
    let mut zi: i64 = 0;
    for _ in 0..rep {
        let zr_next = zr * zr / lim - zi * zi / lim + x;
        let zi_next = zr * zi * 2 / lim + y;
        let dist2 = zr_next * zr_next / lim + zi_next * zi_next / lim;
        if 4 * lim < dist2 {
            return false;
        }
        zr = zr_next;
        zi = zi_next;
    }
    return true;
}

fn count_mandel(rep: i32, div: i32) -> i64 {
    let lim: i64 = (1 as i64) << div;
    let mut count = 0 as i64;
    for y in (-lim)..=lim {
        for x in (-lim)..=lim {
            if is_mandel(rep, lim, x, y) {
                count += 1;
            }
        }
    }
    return count;
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let rep: i32 = if args.len() < 2 {
        100
    } else {
        args[1].parse().unwrap()
    };
    let div: i32 = if args.len() < 3 {
        8
    } else {
        args[2].parse().unwrap()
    };
    println!("rep={}  div={}", rep, div);
    println!("result={}", count_mandel(rep, div));
}
