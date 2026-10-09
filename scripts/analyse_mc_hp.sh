set -u
set -o pipefail

YOUR_DATASET="/eos/cms/store/group/phys_smp/ec/DAS/0071/M0_mkNtuples/Pythia"
PU_Weights_JSON="/eos/user/k/kraychev/DASSChool2026/long-ex/second_r_analysis/long-ex-smp-jet/D0_mkNtuples/Collisions26_runD.json.gz"




# mkdir -p M1_mergeNtuples
# submit mergeNtuples -F "$YOUR_DATASET" M1_mergeNtuples /dev/null /dev/null

# mkdir -p M2_applyPUweights
# submit -N 5000000 -F applyPUweights M1_mergeNtuples M2_applyPUweights "$PU_Weights_JSON" "Collisions26_runD" 99999 -b

mkdir -p M3_applyPUcleaning
submit -N 5000000 -F applyPUcleaning M2_applyPUweights M3_applyPUcleaning M0_mkNtuples/HardMBeventIDs_highPU.txt 98
