# Contains Duplicate II Shenanigans
This repo includes my files and sorrow for a C solution to "219. Contains Duplicate II".

- `best.c` is the "optimized for the problem" solution
- `fine.c` is the good version that runs well
- `fine.cpp` is the good C++ solution that uses STL
- `with_got.c` is the solution with my got library (multiple versions)
- `awful.c` is the original solution

# Build, Run, Test
To build and run, have any decent C compiler and C++ compiler, then run `make`. 

This should build all of them with and without optimizations (-O2 -march=native).

The executables will then be run and `time` will be used for a quick comparison.

All of the files include their only test case and their respective executables should return 0 on success.

You can also run `make clean` to clean up the executables.

Made to run for Linux, other platforms may or may not work.

# Results
On my cranky 10th gen i5:

| Name                 | Time    | Time (-O2) |
|----------------------|---------|------------|
| best.c               | 1 ms    | 1 ms       |
| fine.c               | 5 ms    | 4 ms       |
| fine.cpp             | 26 ms   | 6 ms       |
| with_got.c (aligned) | 24 ms   | 8 ms       |
| with_got.c (new)     | 24 ms   | 8 ms       |
| with_got.c (old)     | 2227 ms | 691 ms     |
| awful.c              | 8292 ms | 1893 ms    |

`best.c` was optimized heavily for the leetcode problem, as you can see by its time here.

Interestingly, `fine.c` while performing well here, is quite slow on Leetcode, taking ~700ms (~350ms if we remove the valid field) vs `fine.cpp`'s ~90ms on all tests.

The other solutions use bucket hash tables which you would not expect to be much faster, yet they take a more reasonable time closer to C++.

Otherwise, as expected, my original `awful.c` is well-named, and `with_got.c` uses my older got lib. Both a reminder of my mistakes. Each takes visible seconds.

With the new got lib, `with_got.c` takes a far more reasonable time closer to C++'s `unordered_map` used in fine.cpp. 
I also added a newer version where SIMD loads are aligned to no difference, so I wonder if my CPU is indifferent to that for these purposes.
Though, do note that this table is more of to show how bad the bad results are rather than to compare the different hashtables I used in the better results.

Note that I used the standard 256 elements pre-allocation across all (besides `best.c` since it is static).
An interesting artifact of this is that `awful.c` and old `with_got.c` are hit heavily by being forced to seek the entire space.
On the other hand, increasing it significantly, improved the new `with_got.c` to be on par with `fine.c`, as realloc was a major part of the issue.

# Licensing
All of the code is under BSD-3 Clause except for my got library which is MPL version 2.0.
