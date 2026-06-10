# ============================================================================
#  Dockerfile — Build recipe for the course development container
# ============================================================================
#
# BLOCK B — Images, layers, and the cache
# A Dockerfile is a plain-text script that Docker reads top-to-bottom to
# build an "image". Think of the image as a frozen snapshot of a complete
# Linux system; a "container" is a live, running instance created from
# that snapshot. You can spin up many identical containers from one image,
# and destroying a container leaves the image untouched.
#
# Every instruction (FROM, ENV, RUN …) creates a new read-only "layer"
# stacked on top of the previous ones. Docker caches each layer: if a line
# has not changed since the last build, Docker reuses the cached layer and
# skips rebuilding it — making subsequent builds almost instant.
# This also means that instruction ORDER matters: put rarely-changing
# instructions (FROM, ENV) near the top so the cache stays valid longer,
# and put frequently-changing ones near the bottom.
# (BHB Ch. 3 — containers and image layers)
# ============================================================================


# ----------------------------------------------------------------------------
# BLOCK A — FROM: the base image (kalilinux/kali-rolling:latest) 
# ----------------------------------------------------------------------------
# "FROM" tells Docker which pre-built image to use as the starting point.
# Instead of building a full OS from scratch, we stack our customizations
# on top of an existing one.
#
# We choose kalilinux/kali-rolling:latest because:
#   • Kali Linux is a Debian-based distro purpose-built for security work;
#     it ships with security-focused repositories already configured.
#   • "rolling" means the package list is continuously updated — we always
#     get the newest versions of tools without waiting for a fixed release.
#   • Using an official image from Docker Hub means we trust its provenance
#     and avoid building a base OS ourselves.
# (BHB Ch. 3 — why Kali Linux is the standard lab environment)
FROM kalilinux/kali-rolling:latest


# ----------------------------------------------------------------------------
# BLOCK C — ENV: environment variables
# ----------------------------------------------------------------------------
# Environment variables are key=value pairs that any process running inside
# the container can read. By convention they are written in ALL_CAPS.
# Setting them with ENV makes them permanent for the lifetime of the image
# (not just for one RUN step). (BHB Ch. 1 — environment variables)
#
#   DEBIAN_FRONTEND=noninteractive
#     Tells apt (the Debian/Kali package manager) to run in non-interactive
#     mode: never stop and ask questions, just apply defaults. Without this,
#     some packages would pause the build waiting for keyboard input that
#     will never come — hanging the build indefinitely.
#
#   LANG=es_ES.UTF-8 and LC_ALL=es_ES.UTF-8
#     Set the system locale — the language and character-encoding rules
#     used by programs. UTF-8 is the encoding that supports accented
#     characters (á, é, ñ), the euro sign (€), emojis, and virtually every
#     script in the world. Setting both LANG and LC_ALL ensures all locale
#     categories (date formats, sorting rules, messages …) use Spanish UTF-8.
#
#   TERM=xterm-256color
#     Tells terminal programs what kind of terminal emulator is in use.
#     "xterm-256color" means the terminal can display 256 colors, which
#     enables syntax highlighting in vim/nvim, colored output in tools like
#     htop, and other visual improvements.
#
# The trailing backslash "\" is a line-continuation character — it tells
# the shell (and Docker's parser) that the logical line continues on the
# next physical line. It is purely for readability.
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color


# ----------------------------------------------------------------------------
# BLOCK D — Pre-answering Wireshark's interactive debconf prompt
# ----------------------------------------------------------------------------
# Some packages ask configuration questions during installation.
# Wireshark/tshark asks: "Should non-superusers be able to capture packets?"
# Because we always run as root inside this container we answer "false".
#
# debconf-set-selections feeds the answer into Debian's configuration
# database BEFORE the package is installed, so when apt reaches that
# question it finds the answer already stored and skips the interactive
# dialog. This is the standard way to pre-seed debconf answers in
# Dockerfiles. (BHB Ch. 3 — automating container builds)
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections


# ----------------------------------------------------------------------------
# BLOCK E — The main RUN: apt-get update + install all course tools
# ----------------------------------------------------------------------------
# Why one big RUN instead of many small ones?
# Each RUN instruction creates a new layer. If we ran apt-get install
# separately for every group of packages we would create dozens of layers,
# each carrying its own copy of apt metadata and temporary files, inflating
# the final image size considerably. Combining everything into ONE RUN keeps
# the image lean. (BHB Ch. 3 — minimizing image size)
#
# Key flags:
#   apt-get update                  — refreshes the list of available packages
#                                     from Kali's repositories. Without this,
#                                     apt would try to install from a stale
#                                     (possibly outdated or empty) index.
#   apt-get install -y              — installs packages; -y answers "yes"
#                                     automatically to every confirmation prompt
#                                     (works alongside DEBIAN_FRONTEND above).
#   --no-install-recommends         — installs only the strictly required
#                                     dependencies, skipping "recommended"
#                                     extras. This can save hundreds of MB.
#
# The "&&" operator chains commands: the next command runs ONLY IF the
# previous one exited with status 0 (success). If apt-get update fails,
# the install never starts — the build fails loudly rather than producing
# a broken image. (BHB Ch. 1 — exit codes and the && operator)
#
# The trailing "\" at the end of each package line is line-continuation,
# keeping the long list readable without breaking the single RUN command.
RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    # === Text editors and shells ===
    # neovim / vim — modern and classic terminal text editors.
    # zsh — Z shell; more interactive features than bash (plugins, themes).
    # bash-completion — adds <Tab> auto-complete for bash commands and flags.
    neovim \
    vim \
    zsh \
    bash-completion \
    \
    # === Classic UNIX text-processing tools (BHB Ch. 2) ===
    # perl  — scripting language; many sysadmin one-liners use it.
    # make  — build-automation tool; runs Makefiles.
    # gawk  — GNU awk; processes text column by column, great for log parsing.
    #         (BHB Ch. 2 — awk for structured text processing)
    # sed   — stream editor; find-and-replace on text streams line by line.
    #         (BHB Ch. 2 — sed for in-place substitution)
    # grep  — searches files/streams for lines matching a pattern (regex).
    #         (BHB Ch. 2 — grep for filtering output)
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # === Core UNIX utilities ===
    # coreutils — cat, ls, head, tail, sort, cut, tr, wc, etc.
    #             The fundamental building blocks of shell pipelines.
    #             (BHB Ch. 1 — pipes and redirection with these tools)
    # findutils — find (locate files by name/date/size) and xargs.
    # procps    — ps, top, kill; tools to inspect and manage processes.
    # less      — pager for reading long files one screen at a time.
    # tree      — displays directory hierarchies as an ASCII tree.
    # jq        — parses and queries JSON from the command line; essential
    #             for working with REST APIs and modern tool output.
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # === Manual pages ===
    # The base Kali image strips man pages to save space. We reinstall
    # them because "man bash", "man grep", "man awk" etc. are primary
    # reference material throughout the course. (BHB Ch. 1 — using man)
    man-db \
    manpages \
    manpages-posix \
    \
    # === Download and version-control utilities ===
    # curl / wget — transfer files over HTTP/HTTPS/FTP from the CLI.
    #               curl is scriptable; wget is simpler for bulk downloads.
    #               (BHB Ch. 1 — standard input/output; piping curl output)
    # git       — distributed version-control system; the course repos live here.
    # git-lfs   — Git Large File Storage; handles binary assets efficiently.
    # ca-certificates — root TLS certificates so curl/wget trust HTTPS sites.
    # locales   — locale data files needed to compile our Spanish UTF-8 locale.
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # === Shell script linter ===
    # shellcheck analyses bash/sh scripts and reports bugs, bad practices,
    # and portability issues before you even run the script. It is the
    # standard static-analysis tool for shell scripting.
    shellcheck \
    \
    # === Network reconnaissance ===
    # nmap    — the industry-standard port scanner; detects open ports,
    #           services, and OS fingerprints. (BHB Ch. 3 — network tools)
    # masscan — ultra-fast scanner designed for sweeping huge IP ranges;
    #           trades depth for raw speed compared to nmap.
    nmap \
    masscan \
    \
    # === Packet capture and analysis ===
    # tcpdump — classic CLI packet sniffer; captures raw network traffic
    #           and writes pcap files. (BHB Ch. 3 — traffic analysis)
    # tshark  — the command-line front-end of Wireshark; richer dissectors
    #           than tcpdump and reads/writes the same pcap format.
    tcpdump \
    tshark \
    \
    # === General networking utilities ===
    # netcat-traditional — "the TCP/IP Swiss Army knife"; opens raw TCP/UDP
    #                      connections for testing, port-knocking, simple
    #                      file transfers, and reverse shells.
    # socat             — like netcat but supports SSL, Unix sockets, etc.
    # dnsutils          — dig, nslookup; DNS query tools.
    # whois             — queries domain and IP registration databases.
    # traceroute        — shows the hop-by-hop path to a remote host.
    # mtr-tiny          — combines traceroute + ping for live path monitoring.
    # iproute2          — ip command (modern replacement for ifconfig/route).
    # net-tools         — ifconfig, netstat, route (legacy but still common).
    # iputils-ping      — the standard ping utility.
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    # === Anonymity and traffic obfuscation ===
    # tor         — connects to the Tor anonymity network, routing traffic
    #               through relays to hide the origin IP.
    # torsocks    — a wrapper that transparently routes any program's traffic
    #               through Tor without modifying the program itself.
    # proxychains4 — chains multiple proxy servers (SOCKS4/5, HTTP) so
    #                traffic hops through several layers before reaching
    #                the destination.
    # obfs4proxy  — a pluggable transport that obfuscates Tor traffic to
    #               look like random bytes, defeating deep-packet inspection.
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # === Human-friendly HTTP client ===
    # httpie provides a "http" command with colored, formatted output that
    # is easier to read than raw curl responses — useful when learning to
    # interact with web APIs. (BHB Ch. 1 — working with HTTP from the CLI)
    httpie \
    \
    # --- BLOCK F: Enable the Spanish locale ---
    # /etc/locale.gen lists every available locale, but most are commented
    # out (prefixed with "# "). The sed command removes the comment marker
    # from the "es_ES.UTF-8" line, telling locale-gen to compile that locale.
    # locale-gen then reads the file and generates the binary locale data
    # that the system needs to actually use the locale we set in ENV above.
    # (BHB Ch. 2 — sed for in-place file editing; -i edits the file directly)
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
    # --- BLOCK G: Clean up apt cache — same RUN, same layer ---
    # apt stores downloaded .deb package files in /var/cache/apt/archives
    # and keeps the package-index files under /var/lib/apt/lists/.
    # After installation these are no longer needed.
    #
    # CRITICAL: the cleanup MUST happen in the same RUN command as the
    # install. If we used a separate RUN, Docker would have already
    # committed the cache files into the previous layer — they would still
    # occupy space in the final image even if deleted later. Doing it in
    # the same RUN means the layer is committed WITHOUT those files,
    # significantly reducing image size. (BHB Ch. 3 — layer size best practices)
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# ----------------------------------------------------------------------------
# BLOCK H — SHELL: switch the build shell from sh to bash
# ----------------------------------------------------------------------------
# By default Docker executes RUN commands with /bin/sh -c.
# /bin/sh is a minimal POSIX shell that lacks many bash features:
# arrays, [[ ]] conditionals, process substitution, brace expansion, etc.
# Switching to /bin/bash -c ensures that any subsequent RUN steps can use
# the full bash syntax without portability issues.
# (BHB Ch. 1 — bash vs sh; bash-specific features)
SHELL ["/bin/bash", "-c"]


# ----------------------------------------------------------------------------
# BLOCK I — WORKDIR: default working directory inside the container
# ----------------------------------------------------------------------------
# WORKDIR sets the directory that Docker (and the user) lands in when a
# RUN, CMD, or terminal session starts. If the directory does not exist,
# Docker creates it automatically.
#
# GitHub Codespaces always mounts the repository under
# /workspaces/<repo-name>, so setting /workspaces keeps our terminal
# one "cd" away from our course files without needing to navigate.
WORKDIR /workspaces


# ----------------------------------------------------------------------------
# BLOCK J — Git global configuration and LFS setup
# ----------------------------------------------------------------------------
# These four git config --system lines write to /etc/gitconfig, which
# applies to ALL users and ALL repositories inside the container.
#
#   safe.directory '*'
#     By default Git refuses to operate on a repo whose directory is owned
#     by a different user than the one running git. In Codespaces the
#     /workspaces mount is owned by the host UID, which can differ from root
#     inside the container. The wildcard '*' trusts every directory,
#     preventing "dubious ownership" errors.
#
#   init.defaultBranch main
#     When running "git init", Git used to create a branch named "master".
#     Modern convention (and GitHub default) is "main". This setting
#     eliminates the deprecation warning and aligns with current practice.
#
#   pull.rebase false
#     When you run "git pull", Git can either merge or rebase the remote
#     changes onto your local branch. "false" means merge — the simpler,
#     more intuitive behavior for beginners; it creates a merge commit
#     instead of rewriting history.
#
#   git lfs install --system
#     Registers Git LFS hooks system-wide so that any repository using
#     large binary files (images, datasets, compiled binaries) is handled
#     transparently by LFS without per-repo setup.
RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system


# ----------------------------------------------------------------------------
# BLOCK K — Change the default shell for root to zsh
# ----------------------------------------------------------------------------
# chsh (change shell) updates the entry in /etc/passwd for the specified
# user to use a different login shell. Here we point root's shell to
# /usr/bin/zsh so that every new terminal session — whether in Codespaces
# or a plain "docker run -it" — drops straight into zsh instead of bash
# or sh. zsh was already installed in the big apt-get install block above.
# (BHB Ch. 1 — the shell as the user's primary interface)
RUN chsh -s /usr/bin/zsh root


# ----------------------------------------------------------------------------
# BLOCK L — Here-document: append a custom prompt to .zshrc
# ----------------------------------------------------------------------------
# A here-document (heredoc) is a shell construct that passes a multi-line
# block of text to a command, using a delimiter token (here: 'EOF') to mark
# the start and end of the block. The single-quotes around 'EOF' are
# intentional: they prevent the shell from expanding variables inside the
# heredoc BEFORE writing them to the file — the literal text, including
# dollar signs and backslashes, is written verbatim.
#
# "cat >> /root/.zshrc" APPENDS (>>) the block to zsh's per-user startup
# file. Every time a new zsh session starts, .zshrc is sourced, so our
# prompt configuration is loaded automatically.
#
# What the prompt code does:
#   __set_prompt() is a function assigned to PROMPT_COMMAND (bash) /
#   precmd (zsh-compatible). Zsh calls it before drawing each prompt.
#   It checks the exit code ($?) of the last command:
#     • 0 (success) → shows a green checkmark ✓
#     • non-zero     → shows a red ✗ followed by the numeric exit code
#   PS1 builds the visible prompt string using ANSI escape sequences
#   (\e[36m = cyan, \e[33m = yellow, \e[0m = reset) to color:
#     [Isaak-Romero]  — username label in cyan
#     \W              — current directory (basename only) in yellow
#     the mark        — colored ✓ or ✗ as described above
#   The final " \$ " adds a space and a dollar sign before the cursor.
# (BHB Ch. 1 — the shell prompt, PS1, environment variables)
RUN cat >> /root/.zshrc <<'EOF'

# ===== Course prompt =====
__set_prompt() {
    local ec=$?
    local mark
    if [ $ec -eq 0 ]; then
        mark='\[\e[32m\]✓\[\e[0m\]'
    else
        mark="\[\e[31m\]✗ $ec\[\e[0m\]"
    fi
    PS1="\[\e[36m\][Isaak-Romero]\[\e[0m\] \[\e[33m\]\W\[\e[0m\] $mark \$ "
}
PROMPT_COMMAND=__set_prompt
EOF


# ----------------------------------------------------------------------------
# BLOCK M — CMD: the default command when the container starts
# ----------------------------------------------------------------------------
# CMD defines what process Docker launches when someone runs the container
# without specifying a command explicitly (e.g. "docker run <image>").
# It does NOT run during the image build — that is what RUN is for.
#
# Difference between RUN and CMD:
#   RUN  — executes during BUILD time; its result is baked into the image layer.
#   CMD  — executes at RUN time, when the container actually starts.
#
# The JSON array syntax ["executable", "arg"] is preferred over shell form
# because it does not wrap the command in a shell — the process is PID 1
# directly, which means signals (SIGTERM, SIGINT) reach it correctly.
#
# We set /usr/bin/zsh so that "docker run -it <image>" drops the user
# into an interactive zsh session. GitHub Codespaces overrides CMD with
# its own VS Code terminal, but having CMD defined here makes the image
# useful as a standalone container too.
# (BHB Ch. 1 — the shell as the entry point; BHB Ch. 3 — Docker CMD)
CMD ["/usr/bin/zsh"]
