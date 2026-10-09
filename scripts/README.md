# Data analysis workflow

The executable script is [`analyse_data`](./analyse_data). It demonstrates a
sequential workflow where each step waits for the previous command to finish
and receives that command's output.

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

1. `run_step` executes one command synchronously.
2. The command's standard output is stored in `STEP_RESULT`.
3. The next step receives that output as its first argument.
4. If a command fails, the script prints the step name and exit code, stops
   immediately, and returns the same failure status.

The current file contains example functions named `step_one`, `step_two`, and
`step_three`. Replace their command bodies with the actual data-analysis
commands. Keep the `run_step` calls in `main` in the order required by the
workflow.

For example, this call passes the output of step one to step two:

```bash
run_step "Step 1" step_one || return $?
previous_result="$STEP_RESULT"
run_step "Step 2" step_two "$previous_result" || return $?
```
