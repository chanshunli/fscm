# Makefile for building FSCM

# +RTS option: -prof -auto-all
SRC = Main.hs Scheme/Interp.hs Scheme/Eval.hs Scheme/Types.hs Scheme/Primitives.hs Scheme/Scan.hs Scheme/Parser.hs
EXE = fscm.exe
TOOLCHAIN-PATH = "C:/Program Files/Haskell Platform/8.2.2/mingw/bin"

all: fscm

fscm: $(SRC)
	ghc --make Main.hs -fwarn-missing-signatures -optc-Os -O2 -o $(EXE)

Scheme/Scan.hs: Scheme/Scan.x
	alex Scheme/Scan.x

Scheme/Parser.hs: Scheme/Parser.y
	happy --strict Scheme/Parser.y

prof: fscm-prof

fscm-prof: $(SRC)
	ghc --make Main.hs -prof -auto-all -fwarn-missing-signatures -optc-Os -O2 -o $(EXE)

run: fscm
	rlwrap ./fscm.exe
clean:
	rm -f $(EXE)
	rm -f *.o *.hi
	rm -f Scheme/*.o Scheme/*.hi
	rm -f Scheme/Scan.hs Scheme/Parser.hs
