#!/bin/bash

__electricflow_advice(){
    echo ""
    echo -en "\033[0;31m$1\033[0m"
    COMPREPLY=('~=~=~=~=~=~' '=~=~=~=~=~=')
}

__electricflow_args_agent_common=(
    '--temp <directory>'
    '--installDirectory <directory>'
    '--dataDirectory <directory>'
    '--debugLog <console|onerror>'
    '--parallelInstallName <name>'
    '--trustedAgent'
    '--trustedAgentCAM'
    '--workspaceName <workspace>'
    '--zoneName <zonename>'
    '--installAgent'
    '--agentGatewayURL <url>'
    '--agentMaxMemoryMB <maximum memory in MB>'
    '--agentMaxMemory <maximum memory in precentage>'
    '--agentInitMemoryMB <initial memory in MB>'
    '--agentInitMemory <initial memory in precentage>'
    '--agentProxyHost <ip address or hostname>'
    '--agentProxyPort <port>'
    '--agentNoProxyHosts <list>'
    '--agentTLSEnabledProtocols <list>'
    '--agentWrapperJavaAdditional <additional>'
    '--agentWrapperJavaClasspath <additional>'
    '--agentWrapperJavaLibraryPath <additional>'
    '--agentMaxConnections <max>'
    '--agentMaxConnectionsPerRoute <max>'
    '--agentLocalPort <port>'
    '--agentPort <port>'
    '--agentProtocol <https|http>'
    '--agentArtifactCache <directory>'
    '--agentPluginsDirectory <directory>'
    '--agentUnixShellPattern <pattern>'
    '--remoteServer <remote server>'
    '--remoteServerPassword <remote server password>'
    '--remoteServerUser <remote server user>'
    '--remoteServerCreateResource'
    '--remoteServerResource <resource name>'
    '--remoteServerResourceType <registered|concurrent>'
)

__electricflow_args_agent_windows=(
    '--windowsAgentLocalSystem'
    '--windowsAgentDomain <domain>'
    '--windowsAgentUser <user>'
    '--windowsAgentPassword <password>'
    '--mode <silent|standard>'
    '--agentWindowsServiceStartType <auto_start|delayed_auto_start>'
)

__electricflow_args_agent_linux=(
    '--nonRoot'
    '--skipCheckUserHomeDirectory'
    '--unixAgentGroup <group>'
    '--unixAgentUser <user>'
    '--mode <silent|console|standard>'
    '--agentAllowRootUser'
)

__electricflow_args_full_common=(
    '--installServer'
    '--installDatabase'
    '--installRepository'
    '--installWeb'
    '--useSameServiceAccount'
    '--databasePassword <password>'
    '--databaseEnableService <1|yes|true|0|no|false>'
    '--databasePort <port>'
    '--databaseMemoryBufferSize <size>'
    '--serverFileTransferPort <port>'
    '--serverName <name>'
    '--serverHttpPort <port>'
    '--serverHttpsPort <port>'
    '--serverInitMemory <percent>'
    '--serverMaxMemory <percent>'
    '--serverInitMemoryMB <initial memory in MB>'
    '--serverMaxMemoryMB <maximum memory in MB>'
    '--serverTLSEnabledProtocols <protocols>'
    '--serverProxyPort <port>'
    '--serverProxyHost <host>'
    '--serverNoProxyHosts <hosts>'
    '--serverStatsdHost <statsd host>'
    '--serverStatsdPort <statsd port>'
    '--serverStatsdPrefix <statsd prefix>'
    '--serverStatsdIncludeHostname <true|false>'
    '--serverZooKeeperConnection <zookeeper servers>'
    '--serverExhibitorConnection <exhibitor servers>'
    '--serverBindIp <host>'
    '--serverIgnoreServerMismatch <0|1>'
    '--serverPreserveSessions <0|1>'
    '--serverWrapperJavaClasspath <additional>'
    '--serverWrapperJavaLibraryPath <additional>'
    '--wrapperJavaAdditional <additional>'
    '--webHostName <host>'
    '--webHttpPort <port>'
    '--webPluginsDirectory <directory>'
    '--webTargetHostName <name>'
    '--webTargetHttpPort <port>'
    '--webTargetHttpsPort <port>'
    '--webDisableHttpsRedirection <0|1>'
    '--webCsrfProtection <true|false>'
    '--webDefaultUI <commander|flow>'
    '--webHttpsPort <port>'
    '--repositoryPort <port>'
    '--repositoryTargetHostName <target>'
    '--repositoryProtocol <https|http>'
    '--repositoryValidateFromDisk <0|1>'
    '--repositoryInitMemory <percent>'
    '--repositoryMaxMemory <percent>'
    '--repositoryInitMemoryMB <initial memory in MB>'
    '--repositoryMaxMemoryMB <max memory in MB>'
    '--repositoryTLSEnabledProtocols <protocols>'
)

__electricflow_args_full_windows=(
    '--windowsServerLocalSystem'
    '--windowsServerUser <user>'
    '--windowsServerDomain <domain>'
    '--windowsServerPassword <password>'
)

__electricflow_args_full_linux=(
    '--unixServerUser <user>'
    '--unixServerGroup <group>'
)

__electricflow_args_dois_common=(
    '--temp <directory>'
    '--installDirectory <directory>'
    '--dataDirectory <directory>'
    '--debugLog <console|onerror>'
    '--remoteServer <host[:port]>'
    '--remoteServerPassword <password>'
    '--remoteServerUser <user>'
    '--disableRemoteServer'
    '--continueOnMemoryCheckError'
    '--elasticsearchPort <port>'
    '--elasticsearchInternalPort <port>'
    '--elasticsearchDataDirectory <directory>'
    '--elasticsearchClusterName <name>'
    '--elasticsearchClusterDiscoveryHosts <list>'
    '--elasticsearchClusterMinimumMasterNodes <number>'
    '--elasticsearchNodeName <name>'
    '--elasticsearchNodeMaster <true|1|yes|false|0|no>'
    '--elasticsearchNodeData <true|1|yes|false|0|no>'
    '--elasticsearchNodeIngest <true|1|yes|false|0|no>'
    '--elasticsearchPublishHost <host>'
    '--elasticsearchIndexNumberOfShards <number>'
    '--hostName <host>'
    '--elasticsearchMemoryMB <size>'
    '--disableSSL'
    '--enableSSL'
    '--elasticsearchRegenerateCertificates'
    '--elasticsearchNodeAdditional'
    '--elasticsearchCACertificateFile <file>'
    '--elasticsearchUserPassword <password>'
    '--logstashInternalPort <port>'
    '--logstashInitMemoryMB <size>'
    '--logstashMaxMemoryMB <size>'
    '--logstashPort <port>'
)

__electricflow_args_dois_linux=(
    '--nonRoot'
    '--skipCheckUserHomeDirectory'
    '--unixAgentGroup <group>'
    '--unixAgentUser <user>'
    '--mode <silent|console|standard>'
)

__electricflow_args_dois_windows=(
    '--mode <silent|standard>'
    '--windowsServerLocalSystem'
    '--windowsServerUser <user>'
    '--windowsServerDomain <domain>'
    '--windowsServerPassword <password>'
)

__electricflow_args_dofs_common=(
    '--temp <directory>'
    '--installDirectory <directory>'
    '--dataDirectory <directory>'
    '--debugLog <console|onerror>'
    '--licenseFile <file>'
    '--remoteServer <host[:port]>'
    '--remoteServerPassword <password>'
    '--remoteServerUser <user>'
    '--disableRemoteServer'
    '--skipCheckDevOpsInsightServer'
    '--serverPort <port>'
    '--hostName <host>'
    '--devopsInsightServer <host>'
    '--devopsInsightServerPort <port>'
    '--devopsInsightServerUser <user>'
    '--devopsInsightServerPassword <password>'
)

__electricflow_args_dofs_linux=(
    '--unixAgentGroup <group>'
    '--unixAgentUser <user>'
    '--mode <silent|console|standard>'
)

__electricflow_args_dofs_windows=(
    '--mode <silent|standard>'
    '--windowsServerLocalSystem'
    '--windowsServerUser <user>'
    '--windowsServerDomain <domain>'
    '--windowsServerPassword <password>'
)

if [[ "`uname -o`" = "Cygwin" ]]; then
    __electricflow_args_full=("${__electricflow_args_agent_common[@]}" "${__electricflow_args_agent_windows[@]}" "${__electricflow_args_full_common[@]}" "${__electricflow_args_full_windows[@]}")
    __electricflow_args_agent=("${__electricflow_args_agent_common[@]}" "${__electricflow_args_agent_windows[@]}")
    __electricflow_args_dois=("${__electricflow_args_dois_common[@]}" "${__electricflow_args_dois_windows[@]}")
    __electricflow_args_dofs=("${__electricflow_args_dofs_common[@]}" "${__electricflow_args_dofs_windows[@]}")
else
    __electricflow_args_full=("${__electricflow_args_agent_common[@]}" "${__electricflow_args_agent_linux[@]}" "${__electricflow_args_full_common[@]}" "${__electricflow_args_full_linux[@]}")
    __electricflow_args_agent=("${__electricflow_args_agent_common[@]}" "${__electricflow_args_agent_linux[@]}")
    __electricflow_args_dois=("${__electricflow_args_dois_common[@]}" "${__electricflow_args_dois_linux[@]}")
    __electricflow_args_dofs=("${__electricflow_args_dofs_common[@]}" "${__electricflow_args_dofs_linux[@]}")
fi

__electricflow_complete(){

    local cur prev i args

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    local adv_return

    local OLDIFS="$IFS"
    local IFS=$'\n'

    local args=("${__electricflow_args[@]}")

    COMPREPLY=()

    if [[ $cur =~ ^-- ]]; then

        COMPREPLY=($(compgen -W '${args[*]}' -- "$cur"))

        if [[ ${#COMPREPLY[*]} -eq 1 ]]; then
            COMPREPLY=(${COMPREPLY[0]%% *})
        else
            for (( i=0; i<=$(( ${#COMPREPLY[*]} - 1 )); i++ )); do
                local reply="${COMPREPLY[$i]%% *}"
                if [[ $reply = $cur ]]; then
                    COMPREPLY=($reply)
                    break
                fi
            done
        fi

    else

        for (( i=0; i<=$(( ${#args[*]} - 1 )); i++ )); do

            local param="${args[$i]%% *}"

            if [[ $prev = $param ]]; then

                if [[ $param == ${args[$i]} ]]; then
                    break
                fi

                case "$prev" in
                    --unixServerGroup)
                        adv_return=user
                        ;;
                    --unixAgentUser)
                        adv_return=user
                        ;;
                    --unixServerGroup)
                        adv_return=group
                        ;;
                    --unixAgentGroup)
                        adv_return=group
                        ;;
                    --windowsAgentUser)
                        adv_return=user
                        ;;
                    --windowsServerUser)
                        adv_return=user
                        ;;
                     --installDirectory)
                        adv_return=dir
                        ;;
                     --dataDirectory)
                        adv_return=dir
                        ;;
                     --temp)
                        adv_return=dir
                        ;;
                     --elasticsearchDataDirectory)
                        adv_return=dir
                        ;;
                     --elasticsearchCACertificateFile)
                        adv_return=file
                        ;;
                     --licenseFile)
                        adv_return=file
                        ;;
                esac

                if [[ -n $adv_return ]]; then
                    break
                fi

                local param_arg="${args[$i]#* }"
                param_arg=${param_arg/</}
                param_arg=${param_arg/>/}

                if [[ $param_arg == *'|'* ]]; then
                    local IFS='|'
                    args=($param_arg)
                    local IFS=$'\n'
                else
                   __ectool_advice "<enter the \"$param_arg\" here>"
                fi

            fi

        done

        if [[ ${#COMPREPLY[*]} -eq 0 && -z $adv_return ]]; then
            COMPREPLY=($(compgen -W '${args[*]}' -- "$cur"))
        fi

    fi

    case "$adv_return" in
        dir)
            compopt -o dirnames
            #COMPREPLY=($(compgen -S "/" -d -- ${cur}))
            ;;
        file)
            compopt -o default
            ;;
        user)
            COMPREPLY=($(compgen -u -- "$cur"))
            ;;
        group)
            COMPREPLY=($(compgen -g -- "$cur"))
            ;;
    esac

    IFS="$OLDIFS"

}

__electricflow(){

    local cmd

    if [[ $1 = 'sudo' ]]; then
        cmd="${COMP_WORDS[1]}"
    else
        cmd="$1"
    fi

    __electricflow_args=()

    if [[ $cmd =~ ElectricCommander-[0-9\.]+(\.exe)? || $cmd =~ ElectricFlow(-x(86|64))?-[0-9\.]+(\.exe)? || $cmd =~ \`lastbuild(\ common(32)?)?\` ]]; then

        __electricflow_args=("${__electricflow_args_full[@]}")

    elif [[ $cmd =~ ElectricFlowAgent-x(86|64)-[0-9\.]+(\.exe)? || $cmd =~ \`lastbuild\ agent(32|64|64p)?\` ]]; then

        __electricflow_args=("${__electricflow_args_agent[@]}")

    elif [[ $cmd =~ ElectricFlowDevOpsInsightServer-x64-[0-9\.]+(\.exe)? || $cmd =~ \`lastbuild\ dois\` ]]; then

        __electricflow_args=("${__electricflow_args_dois[@]}")

    elif [[ $cmd =~ ElectricFlowDevOpsForesightServer-x64-[0-9\.]+(\.exe)? || $cmd =~ \`lastbuild\ dofs\` ]]; then

        __electricflow_args=("${__electricflow_args_dofs[@]}")

    fi

    if [[ ${#__electricflow_args[*]} -gt 0 ]]; then

        compopt +o default
        __electricflow_complete
        return

    fi

}

# Install the default completion (-D option) only if it is supported. This requires bash v4.2+.
complete -p -D >/dev/null 2>&1 && complete -o default -D -F __electricflow || true
