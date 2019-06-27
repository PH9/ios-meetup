# Run SwiftLint
set -o xtrace

START_DATE=$(date +"%s")

SWIFT_LINT=/usr/local/bin/swiftlint

if [[ -e "${SWIFT_LINT}" ]]; then
    echo "SwiftLint version: $(${SWIFT_LINT} version)"

    # Run for both staged and unstaged files
   SWIFT_GIT_DIFF="$(git diff --name-only | grep '\.swift' | tr '\n' ' ' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
   SWIFT_CACHED_DIFF="$(git diff --cached --name-only | grep '\.swift' | tr '\n' ' ' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

   ALL_SWIFT_DIFF="$(echo "${SWIFT_GIT_DIFF} ${SWIFT_CACHED_DIFF}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

    echo ${ALL_SWIFT_DIFF}

    if [[ $ALL_SWIFT_DIFF != "" ]]; then
        ${SWIFT_LINT} autocorrect ${ALL_SWIFT_DIFF}
        ${SWIFT_LINT} lint ${ALL_SWIFT_DIFF}
    fi
else
    echo "SwifLint is not installed."
    echo "Expected location is '${SWIFT_LINT}'"
    echo "Please install it. eg. 'brew install swiftlint'"
    echo ""
    echo "if brew not found please use below script to install Homebrew"
    echo '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    exit 1
fi

END_DATE=$(date +"%s")

DIFF=$(($END_DATE - $START_DATE))
echo "SwiftLint took $(($DIFF / 60)) minutes and $(($DIFF % 60)) seconds to complete."

