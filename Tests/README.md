# COVID-19 Pilot Workflow Tests

This folder contains tests for the COVID-19 Building Blocks.

## Scripts

There is a set of scripts to ease the Building Blocks testing:

```bash
.
├── 1_run_maboss_bb.sh
├── 2_run_single_cell_bb.sh
├── 3_run_personalize_patient_bb.sh
├── 4_run_physiboss_bb.sh
└── 5_run_meta_analysis_BB.sh
```

These scripts can be executed one after the other.

**WARNING:** Please, update the ``PERMEDCOE_IMAGES`` environment 
variables exported within each script to the appropriate
singularity container folder and assets folder accordingly.

Finally, there is a ``clean.sh`` script aimed at cleaning the results of the
building blocks execution.
