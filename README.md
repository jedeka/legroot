# legroot
Lerobot's patch for GR00T, torch==2.12.0.dev20260316+cu128, transformers==5.3.0, lerobot==0.5.1

## HOWTO
1. Clone lerobot official repo: `git clone https://github.com/huggingface/lerobot.git` 
2. Install GR00T for lerobot (https://huggingface.co/docs/lerobot/en/groot) 
```
# Check https://pytorch.org/get-started/locally/ for your system
pip install "torch>=2.2.1,<2.8.0" "torchvision>=0.21.0,<0.23.0" # --index-url https://download.pytorch.org/whl/cu1XX
pip install ninja "packaging>=24.2,<26.0" # flash attention dependencies
pip install "flash-attn>=2.5.9,<3.0.0" --no-build-isolation
python -c "import flash_attn; print(f'Flash Attention {flash_attn.__version__} imported successfully')"
```
3. Copy groot to `policies` dir. 
```
# Create backup just in case 
mv lerobot/src/lerobot/policies/groot lerobot/src/lerobot/policies/groot_bkp 
cp -r groot lerobot/src/lerobot/policies/
```
