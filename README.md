# perplex
> Git Client in a TUI format

### Building
You need 
- ghc 
- cabal

```sh
git clone https://github.com/krissemicolon/perplex.git
cd perplex
cabal update
cabal build
```

### Dependencies
- [brick](https://hackage.haskell.org/package/brick)
- [gitlib](https://hackage.haskell.org/package/gitlib)
- [directory](https://hackage.haskell.org/package/directory)
- [cursor](https://hackage.haskell.org/package/cursor)
- [vty](https://hackage.haskell.org/package/vty)

### Brick architecture
```
         Start
           |
           V
Event -> State -> Draw
  ^                 |
  |                 |
   \-    Brick   <-/
```
```
s: State                : TuiState
e: Custom events
n: Name of resources    : ResourceName
```