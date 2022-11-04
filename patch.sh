#!/usr/bin/env sh

if [ "${1}" = "-R" ]; then
  sed -i -e 's/^[[:blank:]]*"nameLong":.*/\t"nameLong": "Code - OSS",/' \
    -e '/^[[:blank:]]*"extensionEnabledApiProposals"/d' \
    -e '/^[[:blank:]]*"extensionSyncedKeys/d' \
    /usr/lib/code/product.json
else
  # To patch proposed api:
  # Use vim to visual select "extensionEnabledApiProposals"
  # Then press :join<CR>
  # To patch sync server:
  # Use vim to visual select "extensionSyncedKeys" "auth" "configurationSync.store" "editSessions.store"
  # Then press :join<CR>
  # Select joined line and execute :'<,'>s/\//\\\//g
  sed -i -e 's/^[[:blank:]]*"nameLong":.*/\t"nameLong": "Visual Studio Code - Insiders",/' \
    -e '/^[[:blank:]]*"extensionsGallery"/i\\t"extensionEnabledApiProposals": { "ms-vscode.vscode-selfhost-test-provider": ["testObserver"], "VisualStudioExptTeam.vscodeintellicode-completions": ["inlineCompletionsNew", "inlineCompletionsAdditions"], "ms-vsliveshare.vsliveshare": ["contribMenuBarHome", "diffCommand", "documentFiltersExclusive", "fileSearchProvider", "findTextInFiles", "notebookCellExecutionState", "notebookLiveShare", "terminalDimensions", "terminalDataWriteEvent", "textSearchProvider"], "ms-vscode.js-debug": ["portsAttributes", "findTextInFiles", "workspaceTrust", "resolvers", "tunnels"], "ms-toolsai.vscode-ai-remote": ["resolvers"], "ms-python.python": ["quickPickSortByLabel", "testObserver"], "ms-dotnettools.dotnet-interactive-vscode": ["notebookMessaging"], "GitHub.codespaces": ["contribEditSessions", "contribMenuBarHome", "contribRemoteHelp", "contribViewsRemote", "resolvers", "tunnels", "terminalDataWriteEvent", "treeViewReveal", "notebookKernelSource"], "ms-vscode.azure-repos": ["extensionRuntime", "fileSearchProvider", "textSearchProvider"], "ms-vscode.remote-repositories": ["contribEditSessions", "contribRemoteHelp", "contribMenuBarHome", "contribViewsRemote", "contribViewsWelcome", "contribShareMenu", "documentFiltersExclusive", "editSessionIdentityProvider", "extensionRuntime", "fileSearchProvider", "quickPickSortByLabel", "workspaceTrust", "scmSelectedProvider", "scmValidation", "textSearchProvider", "timeline"], "ms-vscode-remote.remote-wsl": ["resolvers", "contribViewsRemote", "telemetry"], "ms-vscode-remote.remote-ssh": ["resolvers", "tunnels", "terminalDataWriteEvent", "contribViewsRemote", "telemetry"], "ms-vscode.remote-server": ["resolvers", "tunnels"], "ms-vscode.remote-explorer": ["contribViewsRemote", "extensionsAny"], "ms-vscode-remote.remote-containers": ["contribEditSessions", "resolvers", "tunnels", "workspaceTrust", "terminalDimensions", "contribViewsRemote"], "ms-vscode.js-debug-nightly": ["portsAttributes", "findTextInFiles", "workspaceTrust", "resolvers", "tunnels"], "ms-vscode.lsif-browser": ["documentFiltersExclusive"], "GitHub.vscode-pull-request-github": ["tokenInformation", "commentsResolvedState", "contribShareMenu", "contribCommentPeekContext", "treeItemCheckbox"], "GitHub.copilot": ["inlineCompletionsNew", "inlineCompletionsAdditions"], "GitHub.copilot-nightly": ["inlineCompletionsNew", "inlineCompletionsAdditions"], "GitHub.remotehub": ["contribRemoteHelp", "contribMenuBarHome", "contribViewsRemote", "contribViewsWelcome", "documentFiltersExclusive", "extensionRuntime", "fileSearchProvider", "quickPickSortByLabel", "workspaceTrust", "scmSelectedProvider", "scmValidation", "textSearchProvider", "timeline"], "ms-python.gather": ["notebookCellExecutionState"], "ms-python.vscode-pylance": ["notebookCellExecutionState"], "ms-toolsai.jupyter-renderers": ["contribNotebookStaticPreloads"], "ms-toolsai.jupyter": ["notebookControllerKind", "notebookDeprecated", "notebookMessaging", "notebookMime", "notebookCellExecutionState", "portsAttributes", "quickPickSortByLabel", "notebookKernelSource", "interactiveWindow", "notebookControllerAffinityHidden", "contribNotebookStaticPreloads"], "dbaeumer.vscode-eslint": ["notebookCellExecutionState"], "ms-vscode.azure-sphere-tools-ui": ["resolvers", "tunnels"], "ms-azuretools.vscode-azureappservice": ["terminalDataWriteEvent"], "ms-vscode.anycode": ["extensionsAny"], "ms-vscode.cpptools": ["terminalDataWriteEvent"] },' \
    -e '/^[[:blank:]]*"extensionsGallery/i\\t"extensionSyncedKeys": { "ritwickdey.liveserver": ["liveServer.setup.version"] }, "auth": { "loginUrl": "https:\/\/login.microsoftonline.com\/common\/oauth2\/authorize", "tokenUrl": "https:\/\/login.microsoftonline.com\/common\/oauth2\/token", "redirectUrl": "https:\/\/vscode-redirect.azurewebsites.net\/", "clientId": "aebc6443-996d-45c2-90f0-388ff96faa56" }, "configurationSync.store": { "url": "https:\/\/vscode-sync-insiders.trafficmanager.net\/", "stableUrl": "https:\/\/vscode-sync.trafficmanager.net\/", "insidersUrl": "https:\/\/vscode-sync-insiders.trafficmanager.net\/", "canSwitch": true, "authenticationProviders": { "microsoft": { "scopes": ["openid", "profile", "email", "offline_access"] }, "github": { "scopes": ["user:email"] } } }, "editSessions.store": { "url": "https:\/\/vscode-sync.trafficmanager.net\/", "authenticationProviders": { "microsoft": { "scopes": ["openid", "profile", "email", "offline_access"] }, "github": { "scopes": ["user:email"] } } },' \
    /usr/lib/code/product.json
fi
