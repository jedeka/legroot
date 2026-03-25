#!/usr/bin/env bash


# ***** global config *****
export MUJOCO_GL=egl 
export PYOPENGL_PLATFORM=egl 
export HF_HUB_OFFLINE=0
TIMESTAMP=$(date +"%y%m%d-%H:%M:%S")
USERNAME="jedeka30"

export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True

# export FLASH_ATTENTION_FORCE_DISABLED=1
# export TRANSFORMERS_NO_FLASH_ATTN=1
# export HF_HUB_DISABLE_TELEMETRY=1
# export TRANSFORMERS_ATTENTION_IMPLEMENTATION=eager

# # ***** run lerobot act training *****
  # --dataset.root=datasets/grasp_box_local_260304-15_03_1772610893 \
  # --dataset.root=datasets/fast \
  # --steps=100000 \
  # --policy.repo_id=$USERNAME/${1}_model \


# export HF_HOME=/path/to/your/hf_cache
# export TRANSFORMERS_OFFLINE=1
# export HF_DATASETS_OFFLINE=1
# echo "$FLASH_ATTENTION_FORCE_DISABLED $TRANSFORMERS_NO_FLASH_ATTN $HF_HUB_DISABLE_TELEMETRY $TRANSFORMERS_ATTENTION_IMPLEMENTATION"

## bash run.sh pi0 ./datasets/slow_blue27_red26/
CUDA_VISIBLE_DEVICES=1 lerobot-train \
  --dataset.root=$2 \
  --dataset.repo_id=jedeka30/grasp_box \
  --policy.type=${1} \
  --policy.device=cuda \
  --output_dir=outputs/train/${1}_model/$TIMESTAMP \
  --policy.repo_id=$USERNAME/${1}_model \
  --dataset.video_backend=pyav \
  --wandb.enable=true \
  --wandb.project=act \
  --job_name=${1}_${TIMESTAMP} \
  --save_checkpoint=true \
  --steps=500000 \
  --save_freq=5000 \
  --batch_size=32 \
  --eval.batch_size=1 \
  --eval.n_episodes=1 \
  --eval_freq=2000 \
  --policy.push_to_hub=false \
  --policy.tune_diffusion_model=false \

