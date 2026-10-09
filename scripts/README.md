# Data analysis workflow

The executable script is [`analyse_data`](./analyse_data). It runs a
sequential workflow where `main` calls one step function after another.

## Run it

From this directory:

```sh
chmod +x analyse_data
./analyse_data
```

The `chmod` command is only needed once. The script can then be run with:

```sh
./analyse_data
```

## How it works

Settings such as `YOUR_DATASET`, `SCHOOL_EOS`, and `JES_CORRECTION_TAG` are
defined as variables at the top of the script — edit them there instead of
passing arguments on the command line.

Each step is its own function (`step_one`, `step_two`, ...), and `main` runs
them in order:

```bash
main() {
    step_one
    step_two
}
```

Steps are commented out in `main` until you're ready to run them. Uncomment
one step at a time, in order, as each prior step's output becomes available.
