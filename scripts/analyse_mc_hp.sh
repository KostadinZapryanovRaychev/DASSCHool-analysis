set -u
set -o pipefail

YOUR_DATASET="/eos/cms/store/group/phys_smp/ec/DAS/0071/M0_mkNtuples/Pythia"
PU_Weights_JSON="/eos/user/k/kraychev/DASSChool2026/long-ex/jet_analysis/long-ex-smp-jet/M0_mkNtuples/PythiaFlat.json"
PU_Weights_Tag="Collisions26_runC"



mkdir -p M1_mergeNtuples
submit mergeNtuples -F "$YOUR_DATASET" M1_mergeNtuples /dev/null /dev/null

mkdir -p M2_applyPUweights
submit -N 5000000 -F applyPUweights M1_mergeNtuples M2_applyPUweights "$PU_Weights_JSON" "$PU_Weights_Tag" 99999

mkdir -p M3_applyPUcleaning
submit -N 5000000 -F applyPUcleaning M2_applyPUweights M3_applyPUcleaning M0_mkNtuples/HardMBeventIDs_highPU.txt 98
