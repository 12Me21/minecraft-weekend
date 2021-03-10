**See original: https://github.com/jdah/minecraft-weekend**

# Build (linux only)
`git clone https://github.com/12Me21/minecraft-weekend --depth=1`
`make -j -l` (that is a lowercase L)
(`-j` allows it to run multiple jobs at once, and `-l` limits the number of jobs to a reasonable level)

I replaced the makefile with one that should be faster and more reliable
- downloads submodules automatically
- only runs the (very slow) library makefiles if the library's object file doesn't exist.
- tracks header dependencies automatically
