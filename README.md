
Installation
------------

### macOS

#### Quick start, installing all completers

- Install cmake, macvim and python; Note that the *system* vim is not supported.

&nbsp;

    brew install cmake macvim python

- Install mono, go, node and npm

&nbsp;

    brew install mono go nodejs

- Compile YCM

&nbsp;

    cd ~/.vim/bundle/YouCompleteMe
    python3 install.py --all

- For plugging an arbitrary LSP server, check [the relevant section](#plugging-an-arbitrary-lsp-server)

