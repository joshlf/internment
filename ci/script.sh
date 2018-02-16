# This script takes care of testing your crate

set -ex

# we don't run the "test phase" when doing deploys
if [ -z $TRAVIS_TAG ]; then
    cross build --target $TARGET
    cross build --target $TARGET --release

    if [ ! -z $DISABLE_TESTS ]; then
        return
    fi

    cross test --target $TARGET
    cross test --target $TARGET --release
fi