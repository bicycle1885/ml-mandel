#include <cstdint>
#include <iostream>

bool is_mandel(int rep, std::int64_t lim, std::int64_t x, std::int64_t y) {
  using i_t = std::int64_t;
  i_t zr = 0;
  i_t zi = 0;
  for (int i = 0; i < rep; ++i) {
    // z* = z**2 + c
    i_t zr_ = zr * zr / lim - zi * zi / lim + x;
    i_t zi_ = zr * zi * 2 / lim + y;
    i_t dist2 = zr_ * zr_ / lim + zi_ * zi_ / lim;
    if (4 * lim < dist2) {
      return false;
    }
    zr = zr_;
    zi = zi_;
  }
  return true;
}

std::int64_t count_mandel(int rep, int div) {
  using i_t = std::int64_t;
  i_t lim = 1ULL << div;
  i_t count = 0;
  for (i_t y = -lim; y <= lim; ++y) {
    for (i_t x = -lim; x <= lim; ++x) {
      if (is_mandel(rep, lim, x, y)) {
        ++count;
      }
    }
  }
  return count;
}

int main(int argc, char const *argv[]) {
  int rep = argc < 2 ? 100 : std::atoi(argv[1]);
  int div = argc < 3 ? 8 : std::atoi(argv[2]);
  std::cout << "rep=" << rep << "  div=" << div << std::endl;
  std::cout << "result=" << count_mandel(rep, div) << std::endl;
  return 0;
}
