# Ham Sandwich
A dating simulator for ham. You are ham. You date other ham. Ham dates ham. Ham is ham with ham ham ham. When the ham ham then ham can ham with the ham ham

# Why did you make this monstrosity?
This game was my entry for the Foxwell's Garden Game Ham Game Jam.

I'm still trying to figure out why I thought this was a good idea

# Building
1. Get the files

```sh
git clone https://github.com/Mstrodl/hamsim
cd hamsim
pnpm i
```

2. Build the ink, located at `src/stories/*.ink`. Export as JSON to `src/stories/*.json`

3. Build the webpage

```sh
node_modules/.bin/parcel build src/index.html
```
