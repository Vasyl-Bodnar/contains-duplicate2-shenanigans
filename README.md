# Contains Duplicate II shenigans
This repo includes my files and sorrow for a C solution to "219. Contains Duplicate II".

- `fine.c` is the good version that runs well
- `fine.cpp` is the good C++ solution that uses STL
- `with_got.c` is the solution with my got library (well now an older version of it)
- `awful.c` is the original solution

# Build, Run, Test
To build and run, have any decent C compiler and C++ compiler, then run `make`. 

This should build all of them with and without optimizations (-O2 -march=native).

The executables will then be run and `time` will be used for a quick comparison.

All of the files include their only test case and their respective executables should return 0 on success.

Made to run for Linux, other platforms may or may not work.

# Results
On my cranky 10th gen i5:

| Name       | Time    | Time (-O2) |
|------------|---------|------------|
| fine.c     | 5 ms    | 4 ms       |
| fine.cpp   | 26 ms   | 6 ms       |
| with_got.c | 2227 ms | 691 ms     |
| awful.c    | 8292 ms | 1893 ms    |

Interestingly, `fine.c` while performing well here, is quite slow on Leetcode, taking ~700ms (~350ms if we remove the valid field) vs `fine.cpp`'s ~90ms on all tests.

The other solutions use bucket hash tables which you would not expect to be much faster, yet they take a more reasonable time closer to C++.

Otherwise, as expected, my original `awful.c` is well-named, and `with_got.c` tells me that I have work to do there, with each taking visible seconds.

# Licensing
All of the code is under BSD-3 Clause except for my got library which is MPL version 2.0.
