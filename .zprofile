if [[ $(uname -s) == "Darwin" ]]; then
    case $(uname -m) in
        arm64)
            # Apple Silicon (M1, M2, M3, etc.)
            eval "$(/opt/homebrew/bin/brew shellenv)"
            ;;
        x86_64)
            # Intel Mac
            eval "$(/usr/local/bin/brew shellenv)"
            ;;
    esac
fi

