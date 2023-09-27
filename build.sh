VERSIONED=$1
MKDOCS_CONFIG_FILE="mkdocs.yml"

if [ -n "$VERSIONED" ]; then
    MKDOCS_CONFIG_FILE=mkdocs_"$VERSIONED".yml
fi

mike deploy -F "$MKDOCS_CONFIG_FILE" -b main --prefix versioned_site --ignore "$VERSIONED"

# git 魔法!
git reset --hard HEAD
git reset --mixed HEAD^
