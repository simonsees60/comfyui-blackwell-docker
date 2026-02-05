# Simon's ComfyUI Docker - Qwen Face Swap Workflow Only
# Extends RunPod's official 5090-optimized ComfyUI image

FROM runpod/comfyui:latest-5090

# Switch to workspace directory where ComfyUI is installed
WORKDIR /workspace/ComfyUI

# Ensure git is installed and custom_nodes directory exists
RUN apt-get update && apt-get install -y git && mkdir -p custom_nodes

# Install cg-use-everywhere (Anything Everywhere, Prompts Everywhere)
RUN cd custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

# Install comfyui-easy-use (easy imageSize, easy seed)
RUN cd custom_nodes && \
    git clone https://github.com/yolain/ComfyUI-Easy-Use.git && \
    cd ComfyUI-Easy-Use && \
    pip install -r requirements.txt

# Install ComfyUI-KJNodes (BlockifyMask, ImageAndMaskPreview, etc.)
RUN cd custom_nodes && \
    git clone https://github.com/kijai/ComfyUI-KJNodes.git && \
    cd ComfyUI-KJNodes && \
    pip install -r requirements.txt

# Install comfyui-rmbg (background removal)
RUN cd custom_nodes && \
    git clone https://github.com/1038lab/comfyui-rmbg.git && \
    cd comfyui-rmbg && \
    pip install -r requirements.txt

# Install comfyui_controlnet_aux (DWPreprocessor for depth)
RUN cd custom_nodes && \
    git clone https://github.com/Fannovel16/comfyui_controlnet_aux.git && \
    cd comfyui_controlnet_aux && \
    pip install -r requirements.txt

# Install comfyui_layerstyle (LayerColor, LayerMask nodes)
RUN cd custom_nodes && \
    git clone https://github.com/chflame163/ComfyUI_LayerStyle.git && \
    cd ComfyUI_LayerStyle && \
    pip install -r requirements.txt

# Install masquerade-nodes (Cut By Mask)
RUN cd custom_nodes && \
    git clone https://github.com/BadCafeCode/masquerade-nodes-comfyui.git

# Install rgthree-comfy (Image Comparer)
RUN cd custom_nodes && \
    git clone https://github.com/rgthree/rgthree-comfy.git

# Install ComfyUI-EulerDiscreteScheduler (recommended for Qwen)
RUN cd custom_nodes && \
    git clone https://github.com/erosDiffusion/ComfyUI-EulerDiscreteScheduler.git

# Install ComfyUI Manager (for experimentation)
RUN cd custom_nodes && \
    git clone https://github.com/ltdrdata/ComfyUI-Manager.git

# Set working directory back to workspace root
WORKDIR /workspace
