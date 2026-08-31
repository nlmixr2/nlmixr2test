#!/bin/bash
set -o pipefail
cd "$(dirname "$0")"

echo "=== Starting focei $(date) ==="
Rscript -e 'runEst <- "focei"; source("uiModels.R")' > run_focei.log 2>&1
echo "=== Finished focei $(date), exit=$? ==="

echo "=== Starting foceiLL $(date) ==="
Rscript -e 'runEst <- "foceiLL"; source("uiModels.R")' > run_foceiLL.log 2>&1
echo "=== Finished foceiLL $(date), exit=$? ==="

echo "=== ALL DONE $(date) ==="



# echo "=== Starting saem $(date) ==="
# Rscript -e 'runEst <- "saem"; source("uiModels.R")' > run_saem.log 2>&1
# echo "=== Finished saem $(date), exit=$? ==="

# echo "=== Starting saemLL $(date) ==="
# Rscript -e 'runEst <- "saemLL"; source("uiModels.R")' > run_saemLL.log 2>&1
# echo "=== Finished saemLL $(date), exit=$? ==="

# echo "=== ALL DONE $(date) ==="
