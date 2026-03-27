# OpenBandit
This is an open-source containerized implementation for the excelent overthewire's bandit exercises (as it is in early 2026),
meant to deploy on airgapped environments for training, or just for fun.

## Exercies Implemented
- bandit0_0
- bandit0_1
- bandit0_2

## Basic Explenation
Each exercise has a different user and directory and so they're all set-up at build time in `setup.sh`,
and each of the exercises are also set-up in scripts, under the `setups/` directory.

They're all sourced in `setup.sh` - so that they could use the `passwords` array. 
