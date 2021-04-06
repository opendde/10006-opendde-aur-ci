#!/usr/bin/env sh

if [ "${1}" = "-R" ]; then
  sed -i -e 's/^[[:blank:]]*"nameLong":.*/\t"nameLong": "Code - OSS",/' \
    -e 's/^[[:blank:]]*"extensionAllowedProposedApi":.*/\t"extensionAllowedProposedApi": ["ms-vscode.vscode-js-profile-flame", "ms-vscode.vscode-js-profile-table", "ms-vscode.github-browser", "ms-vscode.github-richnav"],/' \
    /usr/lib/code/product.json
else
  sed -i -e 's/^[[:blank:]]*"nameLong":.*/\t"nameLong": "Visual Studio Code - Insiders",/' \
    -e 's/^[[:blank:]]*"extensionAllowedProposedApi":.*/\t"extensionAllowedProposedApi": ["GitHub.codespaces", "GitHub.vscode-pull-request-github-insiders", "GitHub.vscode-pull-request-github", "Microsoft.vscode-nmake-tools", "ms-ai-tools.notebook-renderers", "ms-azuretools.vscode-docker", "ms-dotnettools.dotnet-interactive-vscode", "ms-python.gather", "ms-python.python", "ms-toolsai.jupyter", "ms-toolsai.notebook-renderers", "ms-toolsai.vscode-ai", "ms-toolsai.vscode-ai-remote", "ms-vscode-remote.remote-containers-nightly", "ms-vscode-remote.remote-containers", "ms-vscode-remote.remote-ssh-edit-nightly", "ms-vscode-remote.remote-ssh-edit", "ms-vscode-remote.remote-ssh-nightly", "ms-vscode-remote.remote-ssh", "ms-vscode-remote.remote-wsl-nightly", "ms-vscode-remote.remote-wsl", "ms-vscode-remote.remote-wsl-recommender", "ms-vscode-remote.vscode-remote-extensionpack-nightly", "ms-vscode-remote.vscode-remote-extensionpack", "ms-vscode.azure-account", "ms-vscode.azure-sphere-tools-ui", "ms-vscode.azure-sphere-tools", "ms-vscode.github-browser", "ms-vscode.github-richnav", "ms-vscode.remotehub", "ms-vscode.remotehub-insiders", "ms-vscode.js-debug-nightly", "ms-vscode.js-debug", "ms-vscode.lsif-browser", "ms-vscode.powershell-preview", "ms-vscode.vscode-github-issue-notebooks", "ms-vscode.vscode-js-profile-flame", "ms-vscode.vscode-js-profile-table", "ms-vscode.vscode-selfhost-test-provider", "ms-vscode.vscode-markdown-notebook", "ms-vsliveshare.cloudenv-explorer", "ms-vsliveshare.cloudenv", "ms-vsliveshare.vsliveshare", "ms-vsonline.vsonline", "jakearl.handydandy-notebook", "dbaeumer.vscode-eslint", "tanhakabir.rest-book"],/' \
    /usr/lib/code/product.json
fi
