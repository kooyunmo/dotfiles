# Machine-specific Ubuntu 18.04 desktop
# Neovim
if ! command -v nvim &> /dev/null; then
    ln -s $(which vim) ~/.local/bin/nvim
fi

# Minimize application when clicking on dock icon
export GIO_EXTRA_MODULES=/usr/lib/x86_64-linux-gnu/gio/modules/

# NVCC
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

# OpenMPI
# export PATH="$HOME/.openmpi/bin:$PATH"
# export LD_LIBRARY_PATH="$HOME/.openmpi/lib:$LD_LIBRARY_PATH"

# llvm and clang (for ccls)
export PATH="/usr/local/clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04/bin:$PATH"

# rust cargo
export PATH="$HOME/.cargo/bin:$PATH"

# go
export PATH="$HOME/builds/go/bin:$PATH"

# vivado
export PATH="/tools/Xilinx/Vivado/2019.1/bin:$PATH"
