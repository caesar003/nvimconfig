# NVIM Configuration

Welcome to my minimal setup of Neovim with [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager.


**Important Note:**


> This Vim configuration is tailored to my specific needs and preferences, optimized for developing Node.js applications. I've intentionally omitted popular plugins like [coc.vim](https://github.com/neoclide/coc.nvim) or [ale](https://github.com/dense-analysis/ale), which offer features like autocomplete and linting at the expense of increased complexity and resource usage.
>
> Instead, this configuration prioritizes speed and simplicity, focusing on leveraging Vim's native capabilities to enhance productivity. By forgoing certain advanced features and language servers running in the background, I've aimed to enforce a "Vim-centric" approach to coding, emphasizing efficient text editing and navigation.
>
> While this setup may lack some modern conveniences, such as advanced autocompletion and real-time linting, it offers a lightweight and responsive environment for writing JavaScript projects. You are highly encouraged to evaluate your own workflow and requirements before incorporating elements of this configuration into your own setup.
>
> Remember, the essence of Vim lies in its flexibility and extensibility. Feel free to experiment and customize this configuration to better suit your individual needs and preferences. And if you're new to Vim or have questions about specific aspects of this setup, don't hesitate to reach me out for assistance.


## How to install

- Create backup (optional but recommended)

```shell
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

- Clone the repo

```shell
mkdir -p ~/.config/nvim
git clone https://github.com/caesar003/nvimconfig ~/.config/nvim
mkdir -p ~/.config/nvim/colors
```

- Start Neovim


```shell
nvim
```
