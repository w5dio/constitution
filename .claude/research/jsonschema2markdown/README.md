# JSON Schema to Markdown Tool Evaluation

## Directory structure

```
jsonschema2markdown/
  example.schema.json          ← shared input schema used for all experiments
  example.yaml                 ← example config file (for reference)
  tools_fetch.sh               ← runs tool_fetch.sh for every tool in sequence
  tools_run.sh                 ← runs tool_run.sh for every tool in sequence
  tools_clean.sh               ← deletes upstream/, output.md, and output/ for every tool
  <NN>-<tool-name>/            ← tool directory
    tool_fetch.sh              ← clones/fetches the tool's upstream source into upstream/
    tool_run.sh                ← runs the tool against the input schema and writes output
    upstream/                  ← upstream source code (gitignored, populated by tool_fetch.sh)
    output.md                  ← tool output, if single file
    output/                    ← tool output, if multiple files
    schema/                    ← only present if the tool requires a modified input schema
      example.schema.json      ← modified version of the shared input schema
      README.md                ← describes what was modified and why
```

## Running the experiments

```bash
./tools_fetch.sh   # fetch all upstream sources
./tools_run.sh     # run all tools and generate outputs
./tools_clean.sh   # delete all upstream sources and outputs
```

## Analysing outputs

The output of each tool run is saved either in a file named `output.md` (for tools that produce single-file output) or in a directory named `output/` (for tools that produce multi-file output) in the tool directory.

The output of each tool should be analysed and reported in [Tool Evaluation Results](../research.md#tool-evaluation-results) in `../research.md` along the following lines:

- Output category: which of the output categories defined in `../research.md` does the output belong to?
- Formatting: what are the characteristics of the output formatting within the output's category?
- Meta-data: what meta-date is included for each field?
- Verbosity: how verbose is the output in general?

If this analysis is performed by a coding agent: work through the tools one by one in discussion with the user, using the points above to structure the discussion for each tool. Agree on what to record before writing to the research file.
