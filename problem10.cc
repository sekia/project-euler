#include <cstdio>
#include <vector>

int main(int argc, const char **argv) {
  std::vector<bool> sieve(2000000 + 1, true);
  sieve[0] = sieve[1] = false;
  long sum = 2;  // Should be 64-bit (or larger) integer.
  for (int i = 3; i < sieve.size(); i += 2) {
    if (!sieve[i]) { continue; }
    sum += i;
    for (int j = i * 2; j < sieve.size(); j += i) { sieve[j] = false; }
  }
  std::printf("%ld\n", sum);
  return 0;
}
