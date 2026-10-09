# Data analysis workflow

## Run it

```sh
chmod +x analyse_data
./analyse_data
```

ptSpectrum Before and After Cleaning High PU MC Data

## Run the high-PU MC workflow

[`analyse_mc_hp.sh`](./analyse_mc_hp.sh) merges ntuples, applies pileup
weights, and applies pileup cleaning for the high-PU MC sample. It has no
shebang and isn't marked executable, so run it with `bash` (or `sh`):

```sh
bash analyse_mc_hp.sh
```

to save in png
events->Draw()
