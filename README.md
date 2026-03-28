# OpenBandit
This is an open-source containerized implementation for the excelent overthewire's bandit exercises (as it is in early 2026),
meant to deploy on airgapped environments for training, or just for fun.

## Exercies Implemented
- bandit0_0
- bandit0_1
- bandit1_2
- bandit2_3
- bandit3_4
- bandit4_5
- bandit5_6
- bandit6_7
- bandit7_8
- bandit8_9

## Basic Explenation
Each exercise has a different user and directory and so they're all set-up at build time in `setup.sh`,
and each of the exercises are also set-up in scripts, under the `setups/` directory.

They're all sourced in `setup.sh` - so that they could use the `passwords` array. 

## Notes
- `bandit7_8` and other randomness-heavy (on setup) exercises may be set to generate low numbers
    thus making the exercise ridicolously easy. keep this in mind if building for training purpuses.
